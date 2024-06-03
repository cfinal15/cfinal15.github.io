#Deciphering Big Data - Individual Project
DROP DATABASE IF EXISTS SchoolSQL;
CREATE DATABASE SchoolSQL; #MySQL isn't case sensitive but I've used uppercase here for clarity
USE SchoolSQL;
#########################################################################################

#Creating a student table, with fictional data
CREATE TABLE students (
	student_id INT NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(50),
    address VARCHAR(50)
    );
#Creating our 4 fictional students
INSERT INTO students (student_id,firstname,lastname,dateofbirth,gender,address) VALUES
(1,'Chris','Final','2000-02-15','Male','12 Dixon Close, Braintree'),
(2,'Dave','Smith','2001-10-01','Male','125A Broadway, Witham'),
(3,'Jenny','Jones','2000-01-11','Female','14 Notlet Rd, Braintree'),
(4,'Saoirse','Lee','2001-03-25','Male','171 Braintree Rd, Witham');
SELECT * FROM students; #Checking our data has been created. 
#########################################################################################

#Creating subject Table for curriculum
CREATE TABLE subjects (
	subject_ID INT NOT NULL,
    subjectname VARCHARACTER(50),
    sub_description TEXT,
    Grade_Level INT);
#Generate Two Subjects of Choice
INSERT INTO subjects (subject_ID,subjectname,sub_description,Grade_Level) VALUES
(1,'Data Science','Theory of Data Science with modules on databases, big data, data visualising and etc...', 9),
(2,'Maths','Basic Mathematics with focus on statistics', 9);
SELECT * FROM subjects;
#########################################################################################

#Creating Teachers
CREATE TABLE teachers (
	teacher_id INT NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    dateofbirth DATE,
    subjectspec VARCHAR(50),
    contactinfo VARCHAR(50)
    );
#Creating our fictional teachers
INSERT INTO teachers(teacher_id,firstname,lastname,dateofbirth,subjectspec,contactinfo) VALUES
(1,'Jeremy','Clarkson','1967-01-01','Phd in Maths', 'j.clarkson@teacher.com'),
(2,'Claire','Ocean','1990-09-29','Programmer', 'c.ocean@teacher.com');
SELECT * FROM teachers;
#########################################################################################

#Creating Classes with teachers and students
CREATE TABLE classes (
	class_id INT NOT NULL,
    subjectid INT,
    teacherid INT,
    startime TIME,
    endtime TIME,
    roomnumber VARCHAR(20)
    );
INSERT INTO classes(class_id,subjectid,teacherid,startime,endtime,roomnumber) VALUES
(1,1,1,'09:00:00','15:00:00','M101'),
(2,2,2,'09:00:00','15:00:00','T299');
SELECT * FROM classes;
#########################################################################################
CREATE TABLE attendance (
	attendance_id INT NOT NULL,
    studentid INT,
    classid INT,
    Classdate DATE,
    attendanceflag INT
    );
INSERT INTO attendance(attendance_id,studentid,classid,Classdate,attendanceflag) VALUES
(1,1,1,'2024-04-25',1),
(2,2,1,'2024-04-25',0),
(3,3,2,'2024-04-26',1),
(4,4,2,'2024-04-26',1);
SELECT * FROM attendance;
#########################################################################################
CREATE TABLE enrolments (
	enrollment_id INT NOT NULL,
    studentid INT,
    classid INT,
    academicyear VARCHAR(9)
    );
INSERT INTO enrolments (enrollment_id,studentid,classid,academicyear) VALUES
(1,1,1,'2024'),
(2,2,1,'2024'),
(3,3,2,'2024'),
(4,4,2,'2024');
#########################################################################################
#Showing tables and the students and teachers present
SHOW TABLES;
#Creating a complex queries of joins to display students names and their subjects/teachers
SELECT 	students.firstname AS 'Student FN',
		students.lastname AS 'Student LN',
		students.gender,
		subjects.subjectname,
		teachers.firstname AS 'Teacher FN',
		teachers.lastname AS 'Teacher LN'
FROM students
JOIN enrolments ON students.student_ID=enrolments.studentid
JOIN classes ON enrolments.classid=classes.class_id
JOIN subjects ON classes.subjectid=subjects.subject_id
JOIN teachers ON classes.teacherid=teachers.teacher_id;

#Queries with WHERE commands to find academic performance (e.g. Class attendance)
SELECT 	students.firstname,
		attendance.Classdate,
		attendance.attendanceflag
FROM students
JOIN enrolments ON students.student_ID=enrolments.studentid
JOIN classes ON enrolments.classid=classes.class_id
JOIN attendance ON attendance.classid=classes.class_id
WHERE attendance.attendanceflag=0; #WHERE commmand showing Chris and Dave missed class on 25th April 2024