// Load environment variables from .env file
require('dotenv').config();

// Import dependencies
const express = require('express');
const cors = require('cors');
const admin = require('firebase-admin');

// Initialize Firebase Admin
admin.initializeApp({
    credential: admin.credential.cert(JSON.parse(process.env.FIREBASE_CREDENTIALS))
});

async function verifyFirebaseToken(req, res, next) {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).send('Unauthorized: No token provided');
    }

    const idToken = authHeader.split('Bearer ')[1];
    try {
        const decodedToken = await admin.auth().verifyIdToken(idToken);
        req.user = decodedToken; // Add the decoded token to the request so it can be used in downstream handlers
        next(); // Continue to the next middleware/route handler
    } catch (error) {
        console.error('Error verifying Firebase token:', error);
        res.status(403).send('Unauthorized: Invalid token');
    }
}

// Connect to db
const pool = require('./database.js');

const app = express();
app.use(cors());
app.use(express.json()); // Body parser for JSON payloads
  
// Route to get drill types, optionally filtered by shot type and/or location
app.get('/api/drill-types', verifyFirebaseToken, async (req, res) => {
    const { shotType, location } = req.query;

    let query = `
        SELECT dt.drill_type_id, dt.description, st.name AS shot_type, sl.location_name, dt.attempts
        FROM drill_types dt
        JOIN shot_types st ON dt.type_id = st.type_id
        JOIN shot_locations sl ON dt.location_id = sl.location_id
    `;

    const conditions = [];
    const params = [];

    if (shotType) {
        conditions.push("st.name = $1");
        params.push(shotType);
    }

    if (location) {
        conditions.push("sl.location_name = $2");
        params.push(location);
    }

    if (conditions.length) {
        query += " WHERE " + conditions.join(' AND ');
    }

    try {
        const result = await pool.query(query, params);
        res.json(result.rows);

        console.log(result)
    } catch (error) {
        console.error('Error fetching drill types:', error);
        res.status(500).send('Error fetching drill types');
    }
});

// Route to get all workouts
app.get('/api/workouts', verifyFirebaseToken, async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM workouts');
        res.json(result.rows);

        console.log(result.rows)
    } catch (error) {
        console.error('Error fetching workouts:', error);
        res.status(500).send('Error fetching workouts');
    }
});

// Route to fetch workout drills by workout ID
app.get('/workout-drills', verifyFirebaseToken, async (req, res) => {
    const { workout_id } = req.body;

    try {
        const workoutDrillQuery = `SELECT wd.workout_drill_id, wd.workout_id, wd.drill_type_id, wd.order_index,
            dt.description, dt.attempts, dt.shot_type_id, dt.location_id
            FROM workout_drills wd
            JOIN drill_types dt ON wd.drill_type_id = dt.drill_type_id
            WHERE wd.workout_id = $1
            ORDER BY wd.order_index;`
        const result = await pool.query(workoutDrillQuery, [workout_id]);

        if (result.rows.length > 0) {
            res.json(result.rows);
        } else {
            res.status(404).send('No drills found for the given workout.');
        }
    } catch (error) {
        console.error('Failed to retrieve workout drills:', error);
        res.status(500).send('Error retrieving workout drills');
    }
});

app.post('/api/sessions/start', verifyFirebaseToken, async (req, res) => {
    const client = await pool.connect(); // Get a client from the connection pool

    try {
        await client.query('BEGIN'); // Start transaction

        const { workout_id } = req.body;
        const user_id = req.user.user_id;

        // Check if the workout exists
        const workoutQuery = 'SELECT * FROM workouts WHERE workout_id = $1';
        const workoutResult = await client.query(workoutQuery, [workout_id]);
        if (workoutResult.rows.length === 0) {
            throw new Error('Workout not found'); // Will be caught by the catch block below
        }

        // Insert new session into the database
        const insertSessionQuery = `
            INSERT INTO sessions (workout_id, user_id, start_time, current_drill_index, is_completed)
            VALUES ($1, $2, NOW(), 1, FALSE)
            RETURNING *;
        `;
        const sessionResult = await client.query(insertSessionQuery, [workout_id, user_id]);
        const newSession = sessionResult.rows[0];

        // Fetch drill types and their associated shot types and locations
        const drillTypesQuery = `
            SELECT wd.drill_type_id,
                dt.description, dt.attempts,
                st.name AS shot_type,
                sl.location_name
            FROM workout_drills wd
            JOIN drill_types dt ON wd.drill_type_id = dt.drill_type_id
            JOIN shot_types st ON dt.shot_type_id = st.shot_type_id
            JOIN shot_locations sl ON dt.location_id = sl.location_id
            WHERE wd.workout_id = $1
            ORDER BY wd.order_index;
        `;
        const drillTypesResult = await client.query(drillTypesQuery, [workout_id]);

        await client.query('COMMIT'); // Commit the transaction

        // Construct the response object with session details and drills
        const response = {
            session: newSession,
            drillTypes: drillTypesResult.rows
        };

        res.json(response);
    } catch (error) {
        await client.query('ROLLBACK'); // Roll back the transaction on error
        console.error('Error starting a session:', error);
        res.status(500).send('Unable to start a session due to an error');
    } finally {
        client.release(); // Release the client back to the pool
    }
});



// Default route for handling everything else
app.use('*', (req, res) => {
  res.status(404).send('API route not found');
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
