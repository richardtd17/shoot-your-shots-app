INSERT INTO allowed_shot_locations (shot_type_id, location_id) VALUES
-- Free Throws only from the Free Throw Line
((SELECT shot_type_id FROM shot_types WHERE name = 'Free Throw'), (SELECT location_id FROM shot_locations WHERE location_name = 'Free Throw Line')),

-- Three Pointers from corners and wings
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Corner')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Corner')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Wing')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Wing')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Top of the Key')),

-- Mid-range and Baseline shots for Pull-Up Jumpers
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Elbow')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Elbow')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Top of the Key')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Baseline')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Baseline')),

-- Floaters usually near the basket
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Left')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Right')),

-- Hook Shots in the post areas
((SELECT shot_type_id FROM shot_types WHERE name = 'Hook Shot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Left')),
((SELECT shot_type_id FROM shot_types WHERE name = 'Hook Shot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Right'));