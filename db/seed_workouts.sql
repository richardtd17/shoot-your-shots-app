-- Insert workouts
INSERT INTO workouts (title, description) VALUES
('Complete Shooter Workout', 'Become a better shooter from all around the court'),
('All-Around Offense Workout', 'Work on your 3 level scoring ability'),
('Pro Level Challenges', 'Think you have what it takes to keep up with the pros?'),
('Midrange Mastery', 'Master your midrange'),
('Sniper', 'Become an elite 3-point shooter');

-- Associating multiple drills to 'Midrange Mastery'
INSERT INTO workout_drills (workout_id, drill_type_id, order_index) VALUES
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 28, 1),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 11, 2),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 12, 3),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 6, 4),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 7, 5),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 8, 6),
((SELECT workout_id FROM workouts WHERE title = 'Midrange Mastery'), 29, 7);

-- Associating multiple drills to 'Sniper'
INSERT INTO workout_drills (workout_id, drill_type_id, order_index) VALUES
((SELECT workout_id FROM workouts WHERE title = 'Sniper'), 29, 1),
((SELECT workout_id FROM workouts WHERE title = 'Sniper'), 23, 2),
((SELECT workout_id FROM workouts WHERE title = 'Sniper'), 24, 3),
((SELECT workout_id FROM workouts WHERE title = 'Sniper'), 25, 4);

-- Associating multiple drills to 'Complete Shooter Workout'
INSERT INTO workout_drills (workout_id, drill_type_id, order_index) VALUES
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 28, 1),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 13, 2),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 9, 3),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 10, 4),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 23, 5),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 24, 6),
((SELECT workout_id FROM workouts WHERE title = 'Complete Shooter Workout'), 28, 7);

-- Associating multiple drills to 'All-Around Offense Workout'
INSERT INTO workout_drills (workout_id, drill_type_id, order_index) VALUES
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 28, 1),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 6, 2),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 7, 3),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 8, 4),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 1, 5),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 20, 6),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 28, 7),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 23, 8),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 26, 9),
((SELECT workout_id FROM workouts WHERE title = 'All-Around Offense Workout'), 27, 10);

-- Associating multiple drills to 'Pro Level Challenges'
INSERT INTO workout_drills (workout_id, drill_type_id, order_index) VALUES
((SELECT workout_id FROM workouts WHERE title = 'Pro Level Challenges'), 29, 1),
((SELECT workout_id FROM workouts WHERE title = 'Pro Level Challenges'), 4, 2),
((SELECT workout_id FROM workouts WHERE title = 'Pro Level Challenges'), 5, 3);


