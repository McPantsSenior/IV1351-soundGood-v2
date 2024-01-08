-- Populate school table
INSERT INTO school (enrolled_students, max_studnets, sibling_discount, max_rented_instruments_per_student, max_lease_time_months)
VALUES (10, 100, 0.1, 2, 12);

-- Populate address table
INSERT INTO address (zip, city, street)
VALUES 
	('12345', 'Music City', 'Melody Street'),
	('54321', 'Harmony Town', 'Rhythm Avenue'),
	('67890', 'Melodyville', 'Song Lane'),
	('98765', 'Tune City', 'Beat Street'),
	('23456', 'Symphony Town', 'Concert Road'),
	('87654', 'Chordville', 'Melody Lane'),
	('34567', 'Harmonytown', 'Music Avenue'),
	('76543', 'Rhythmvale', 'Harmony Street'),
	('45678', 'Songsville', 'Melody Road'),
	('65432', 'Concertburg', 'Beat Lane');

-- Populate phone_num table
INSERT INTO phone_num (phone_num)
VALUES 
	('1234567890'),
	('2345678901'),
	('3456789012'),
	('4567890123'),
	('5678901234'),
	('6789012345'),
	('7890123456'),
	('8901234567'),
	('9012345678'),
	('0123456789');

-- Populate email table
INSERT INTO email (email)
VALUES 
	('info@soundgoodmusic.com'),
	('john.doe@email.com'),
	('jane.smith@email.com'),
	('instructor1@email.com'),
	('student1@email.com'),
	('ensembles@email.com'),
	('grouplesson@email.com'),
	('rent@email.com'),
	('sibling@email.com'),
	('studentensembles@email.com');

-- Populate contact_person table
INSERT INTO contact_person (email_id, phone_num_id)
VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

-- Populate genres table
INSERT INTO genres (genre)
VALUES 
	('Classical'),
	('Jazz'),
	('Rock'),
	('Pop'),
	('Blues'),
	('Country'),
	('Hip-Hop'),
	('Electronic'),
	('Folk'),
	('Reggae');

-- Populate instrument table
INSERT INTO instrument (instrument_name, instrument_brand, monthly_price, total_stock)
VALUES
	('Piano', 'Yamaha', 150, 10),
	('Guitar', 'Fender', 100, 15),
	('Violin', 'Stradivarius', 120, 8),
	('Trumpet', 'Bach', 90, 12),
	('Saxophone', 'Yanagisawa', 110, 10),
	('Drums', 'Pearl', 130, 8),
	('Flute', 'Muramatsu', 80, 15),
	('Bass Guitar', 'Ibanez', 120, 10),
	('Cello', 'DZ Strad', 140, 7),
	('Clarinet', 'Buffet', 100, 12);

-- Populate prices table
INSERT INTO prices (student_price, instructor_payment)
VALUES 
	(100, 70),--beginner and intermediate solo lesson
	(120, 80),--advanced solo lesson
	(70, 100),--beginner and intermediate group lesson
	(80, 120),--advanced group lesson
	(50, 90);--ensembles

-- Populate skill_level table
INSERT INTO skill_level (skill_level)
VALUES 
	('Beginner'),
	('Intermediate'),
	('Advanced');

-- Populate instructor table
INSERT INTO instructor (personal_num, first_name, last_name, teach_ensembles, address_id, school_id, email_id, phone_num_id)
VALUES 
	('133703070001', 'John', 'Doe', true, 1, 1, 1, 1),
	('133703070002', 'Jane', 'Smith', true, 2, 1, 2, 2),
	('133703070003', 'Bob', 'Johnson', true, 3, 1, 3, 3),
	('133703070004', 'Alice', 'Williams', true, 4, 1, 4, 4),
	('133703070005', 'Charlie', 'Miller', true, 5, 1, 5, 5),
	('133703070006', 'Eva', 'Brown', true, 6, 1, 6, 6),
	('133703070007', 'David', 'Jones', true, 7, 1, 7, 7),
	('133703070008', 'Sophia', 'Lee', true, 8, 1, 8, 8),
	('133703070009', 'James', 'Smith', true, 9, 1, 9, 9),
	('133703070010', 'Olivia', 'Davis', true, 10, 1, 10, 10);

-- Populate student table
INSERT INTO student (personal_num, first_name, last_name, address_id, school_id, email_id, phone_num_id, contact_person_id)
VALUES 
	('133703070011', 'Mark', 'Johnson', 1, 1, 1, 1, 1),
	('133703070012', 'Emily', 'Miller', 2, 1, 2, 2, 2),
	('133703070013', 'Daniel', 'Davis', 3, 1, 3, 3, 3),
	('133703070014', 'Sophie', 'Wilson', 4, 1, 4, 4, 4),
	('133703070015', 'Christopher', 'Smith', 5, 1, 5, 5, 5),
	('133703070016', 'Ava', 'Moore', 6, 1, 6, 6, 6),
	('133703070017', 'Michael', 'Brown', 7, 1, 7, 7, 7),
	('133703070018', 'Mia', 'Jones', 8, 1, 8, 8, 8),
	('133703070019', 'David', 'Taylor', 9, 1, 9, 9, 9),
	('133703070020', 'Emma', 'White', 10, 1, 10, 10, 10);

-- Populate student_instrument table
INSERT INTO student_instrument (instrument_id, student_id, skill_level_id)
VALUES 
	(1, 1, 1),
	(2, 1, 1),
	(3, 1, 1),
	
	(1, 2, 1),
	(2, 2, 1),
	(3, 2, 1),

	(1, 3, 1),
	(2, 3, 1),
	(3, 3, 1),

	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 2),
	(7, 7, 2),
	(8, 8, 2),
	(9, 9, 3),
	(10, 10, 3);

-- Populate availability table
INSERT INTO availability (instructor_id, instrument_id, skill_level_id, price_id, start_time, end_time)
VALUES 
	(1, 1, 1, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(2, 2, 1, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(3, 3, 1, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(4, 4, 1, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(5, 5, 1, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(6, 6, 2, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(7, 7, 2, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(8, 8, 2, 1, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(9, 9, 3, 2, '2023-12-01 08:00:00', '2024-03-01 11:00:00'),
	(10, 10, 3, 2, '2023-12-01 08:00:00', '2024-03-01 11:00:00');

-- Populate booking table
INSERT INTO booking (student_id, availability_id, time)
VALUES 
	(1, 1, '2024-01-01 09:00:00'),
	(2, 2, '2024-01-02 14:30:00'),
	(3, 3, '2024-01-03 10:30:00'),
	(4, 4, '2024-01-04 17:00:00'),
	(5, 5, '2024-01-05 12:30:00'),
	(6, 6, '2024-01-06 16:00:00'),
	(7, 7, '2024-01-07 11:30:00'),
	(8, 8, '2024-01-08 15:00:00'),
	(9, 9, '2024-01-09 10:00:00'),
	(10, 10, '2024-01-10 14:00:00');

-- Populate can_play_instrument table
INSERT INTO can_play_instrument (instrument_id, instructor_id)
VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

-- Populate ensembles table
INSERT INTO ensembles (instructor_id, genre_id, price_id, max_students, min_students, time)
VALUES 
	(1, 1, 5, 10, 5, '2024-01-06 12:00:00'),
	(2, 2, 5, 11, 6, '2024-01-07 12:00:00'),
	(3, 3, 5, 12, 7, '2024-01-08 12:00:00'),
	(4, 4, 5, 13, 8, '2024-01-09 12:00:00'),
	(5, 5, 5, 14, 9, '2024-01-10 12:00:00');

-- Populate group_lesson table
INSERT INTO group_lesson (instructor_id, skill_level_id, instrument_id, price_id, max_students, min_students, time)
VALUES 
	(1, 1, 1, 3, 8, 3, '2024-01-07 14:30:00'),
	(2, 1, 2, 3, 8, 3, '2024-01-08 14:30:00'),
	(3, 1, 3, 3, 8, 3, '2024-01-09 14:30:00'),
	(4, 1, 4, 3, 8, 3, '2024-01-10 14:30:00'),
	(5, 1, 5, 3, 8, 3, '2024-01-11 14:30:00');

-- Populate rent table
INSERT INTO rent (student_id, instrument_id, leasing_time_start, leasing_time_end, home_delivery)
VALUES 
	(1, 1, '2024-01-01 10:00:00', '2024-03-01 10:00:00', true),
	(2, 2, '2024-01-01 10:00:00', '2024-03-01 10:00:00', true),
	(3, 3, '2024-01-01 10:00:00', '2024-03-01 10:00:00', true),
	(4, 4, '2024-01-01 10:00:00', '2024-03-01 10:00:00', true),
	(5, 5, '2024-01-01 10:00:00', '2024-03-01 10:00:00', true);

-- Populate siblings table
INSERT INTO siblings (student_id, sibling_id)
VALUES 
-- Students 1, 2, 3 and 4 are siblings
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 1),
	(2, 3),
	(2, 4),
	(3, 1),
	(3, 2),
	(3, 4),
	(4, 1),
	(4, 2),
	(4, 3),
-- Students 5, 6 and 7 are siblings
	(5, 6),
	(5, 7),
	(6, 5),
	(6, 7),
	(7, 5),
	(7, 6),
-- Students 8 and 9 are siblings
	(8, 9),
	(9, 8);
-- Student 10 have no siblings

-- Populate student_ensembles table
INSERT INTO student_ensembles (ensembles_id, student_id, instrument_id)
VALUES 
-- Ensemble 1, min 5 students
	(1, 1, 1),
	(1, 2, 2),
	(1, 3, 3),
	(1, 4, 4),
	(1, 5, 5),
-- Ensemble 2, min 6 students
	(2, 1, 1),
	(2, 2, 2),
	(2, 3, 3),
	(2, 4, 4),
	(2, 5, 5),
	(2, 6, 6),
-- Ensemble 3, min 7 students
	(3, 1, 1),
	(3, 2, 2),
	(3, 3, 3),
	(3, 4, 4),
	(3, 5, 5),
	(3, 6, 6),
	(3, 7, 7),
-- Ensemble 4, min 8 students (Doesn't have enough yet)
	(4, 5, 5),
	(4, 6, 6),
	(4, 7, 7),
	(4, 8, 8),
	(4, 9, 9),
	(4, 10, 10),
-- Ensemble 5, min 9 students (Doesn't have enough yet)
	(5, 5, 5),
	(5, 6, 6),
	(5, 7, 7),
	(5, 8, 8),
	(5, 9, 9),
	(5, 10, 10);

-- Populate student_group_lesson table
INSERT INTO student_group_lesson (group_lesson_id, student_id)
VALUES 
-- Group lesson 1, min 3 students
	(1, 1),
	(1, 2),
	(1, 3),
-- Group lesson 2, min 3 students
	(2, 1),
	(2, 2),
	(2, 3),
-- Group lesson 3, min 3 students
	(3, 1),
	(3, 2),
	(3, 3),
-- Group lesson 4, min 3 students (Doesn't have enough yet)
	(4, 4),
-- Group lesson 5, min 3 students (Doesn't have enough yet)
	(5, 5);
