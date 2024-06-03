CREATE TABLE students (
    student_number INT,
    student_name VARCHAR(100),
    support INT,
    date_of_birth DATE,
    exam_score INT,
    subject_id INT,
    teacher_id INT,
    PRIMARY KEY (student_number, subject_id)
);

INSERT INTO students (student_number, student_name, support, date_of_birth, exam_score, subject_id, teacher_id) VALUES
(1001, 'Bob Baker', 78, '2001-08-25', 2, 1),
(1001, 'Bob Baker', 78, '2001-08-25', 3, 5),
(1001, 'Bob Baker', 78, '2001-08-25', 5, 2),
(1002, 'Sally Davies', 55, '1999-10-02', 3, 5),
(1002, 'Sally Davies', 55, '1999-10-02', 1, 3),
(1002, 'Sally Davies', 55, '1999-10-02', 4, 4),
(1003, 'Mark Hanmill', 90, '1995-06-05', 2, 1),
(1003, 'Mark Hanmill', 90, '1995-06-05', 3, 5),
(1003, 'Mark Hanmill', 90, '1995-06-05', 5, 2),
(1004, 'Anas Ali', 70, '1980-08-03', 3, 5),
(1004, 'Anas Ali', 70, '1980-08-03', 5, 2),
(1004, 'Anas Ali', 70, '1980-08-03', 1, 3),
(1005, 'Cheuk Yin', 45, '2002-05-01', 2, 1),
(1005, 'Cheuk Yin', 45, '2002-05-01', 3, 5),
(1005, 'Cheuk Yin', 45, '2002-05-01', 4, 4);

# Create the teachers table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100)
);

# Insert data into the teachers table
INSERT INTO teachers (teacher_id, teacher_name) VALUES
(1, 'Mr Jones'),
(2, 'Mr Peters'),
(3, 'Mrs Patel'),
(4, 'Ms Daniels'),
(5, 'Ms Parker');

# Create the subjects table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject VARCHAR(100),
    exam_boards VARCHAR(50)
);

# Insert data into the subjects table
INSERT INTO subjects (subject_id, subject, exam_boards) VALUES
(1, 'Biology', 'WJEC'),
(2, 'Computer Science', 'BCS'),
(3, 'Maths', 'EdExcel'),
(4, 'Music', 'AQA'),
(5, 'Physics', 'OCR');
