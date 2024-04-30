-- Insert more predefined drill types into the drill_types table
INSERT INTO drill_types (shot_type_id, location_id, attempts, description) VALUES

-- Pull-Up Jumpers
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Top of the Key'), 15, '15 pull-up jumpers from the top of the key'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Wing'), 10, '10 pull-up jumpers from the left wing'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Wing'), 10, '10 pull-up jumpers from the right wing'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Corner'), 12, '12 pull-up jumpers from the left corner'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Corner'), 12, '12 pull-up jumpers from the right corner'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Free Throw Line'), 15, '15 pull-up jumpers from the free throw line'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Elbow'), 8, '8 pull-up jumpers from the left elbow'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Elbow'), 8, '8 pull-up jumpers from the right elbow'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Baseline'), 6, '6 pull-up jumpers from the left baseline'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Baseline'), 6, '6 pull-up jumpers from the right baseline'),

-- High post pull up jumpers
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Left'), 5, '5 pull-up jumpers from the left high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Right'), 5, '5 pull-up jumpers from the right high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Middle'), 5, '5 pull-up jumpers from the middle high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Left'), 10, '10 pull-up jumpers from the left high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Right'), 10, '10 pull-up jumpers from the right high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Pull-Up Jumper'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Middle'), 10, '10 pull-up jumpers from the middle high post'),


-- Floaters from different locations
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Elbow'), 10, '10 floaters from the left elbow'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Wing'), 10, '10 floaters from the right wing'),

-- High post floaters
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Middle'), 5, '5 floaters from the middle high post'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Floater'), (SELECT location_id FROM shot_locations WHERE location_name = 'High Post Middle'), 10, '10 floaters from the middle high post'),

-- Catch and Shoot from various spots
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Corner'), 20, '20 catch and shoot shots from the left corner'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Corner'), 20, '20 catch and shoot shots from the right corner'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Left Wing'), 10, '10 catch and shoot shots from the left wing'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Right Wing'), 10, '10 catch and shoot shots from the right wing'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Catch and Shoot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Top of the Key'), 10, '10 catch and shoot shots from the top of the key'),

-- Hook Shots
((SELECT shot_type_id FROM shot_types WHERE name = 'Hook Shot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Left'), 12, '12 hook shots from the low post left'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Hook Shot'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Right'), 12, '12 hook shots from the low post right'),

-- Free Throws
((SELECT shot_type_id FROM shot_types WHERE name = 'Free Throw'), (SELECT location_id FROM shot_locations WHERE location_name = 'Free Throw Line'), 5, '5 free throws'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Free Throw'), (SELECT location_id FROM shot_locations WHERE location_name = 'Free Throw Line'), 10, '10 free throws'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Free Throw'), (SELECT location_id FROM shot_locations WHERE location_name = 'Free Throw Line'), 25, '25 free throws'),

-- Dunks
((SELECT shot_type_id FROM shot_types WHERE name = 'Dunk'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Left'), 5, '5 dunks from the low post left'),
((SELECT shot_type_id FROM shot_types WHERE name = 'Dunk'), (SELECT location_id FROM shot_locations WHERE location_name = 'Low Post Right'), 5, '5 dunks from the low post right');