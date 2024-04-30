-- Create shot_types table
CREATE TABLE shot_types (
    shot_type_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE shot_locations (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE allowed_shot_locations (
    shot_type_id INT NOT NULL,
    location_id INT NOT NULL,
    PRIMARY KEY (shot_type_id, location_id),
    FOREIGN KEY (shot_type_id) REFERENCES shot_types(shot_type_id),
    FOREIGN KEY (location_id) REFERENCES shot_locations(location_id)
);

CREATE TABLE drill_types (
    drill_type_id SERIAL PRIMARY KEY,
    shot_type_id INT NOT NULL,
    location_id INT NOT NULL,
    attempts INT NOT NULL,
    description TEXT,
    FOREIGN KEY (shot_type_id) REFERENCES shot_types(shot_type_id),
    FOREIGN KEY (location_id) REFERENCES shot_locations(location_id)
);

-- Table for workouts
CREATE TABLE workouts (
    workout_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table for associating workouts with drill types (Workout Template)
CREATE TABLE workout_drills (
    workout_drill_id SERIAL PRIMARY KEY,
    workout_id INT NOT NULL,
    drill_type_id INT NOT NULL,
    order_index INT,  -- Optional: to maintain order of drills within a workout
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id),
    FOREIGN KEY (drill_type_id) REFERENCES drill_types(drill_type_id)
);

-- Table for sessions, which represent an instance of a user doing a workout
CREATE TABLE sessions (
    session_id SERIAL PRIMARY KEY,
    workout_id INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    current_drill_index INT DEFAULT 1,
    is_completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id)
);

-- Table for recording details on individual drills during a session
CREATE TABLE session_drill_details (
    session_drill_detail_id SERIAL PRIMARY KEY,
    session_id INT NOT NULL,
    workout_drill_id INT NOT NULL,
    attempts INT,
    successes INT,
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (workout_drill_id) REFERENCES workout_drills(workout_drill_id)
);


