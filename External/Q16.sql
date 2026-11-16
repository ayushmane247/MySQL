CREATE DATABASE CollegeDB;
USE CollegeDB;

-- 1. Department
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

-- 2. Faculty
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 3. Course
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Faculty_ID INT,
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

-- 4. Student
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL
);

-- 5. Exam
CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY,
    Exam_Name VARCHAR(50) NOT NULL
);

-- 6. Enrollment (M:N)
CREATE TABLE Enrollment (
    Student_ID INT,
    Course_ID INT,
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- 7. Student_Exam (M:N)
CREATE TABLE Student_Exam (
    Student_ID INT,
    Exam_ID INT,
    PRIMARY KEY (Student_ID, Exam_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
);

SHOW TABLES;

-- Department
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology');

-- Faculty
INSERT INTO Faculty VALUES
(101, 'Prof. Amit', 1),
(102, 'Prof. Neha', 2);

-- Course
INSERT INTO Course VALUES
(201, 'DBMS', 101),
(202, 'Java', 102);

-- Student
INSERT INTO Student VALUES
(301, 'Rahul'),
(302, 'Priya');

-- Exam
INSERT INTO Exam VALUES
(401, 'DBMS Internal'),
(402, 'Java Internal');

-- Enrollment
INSERT INTO Enrollment VALUES
(301, 201),
(302, 202),
(301, 202);

-- Student_Exam
INSERT INTO Student_Exam VALUES
(301, 401),
(302, 402),
(301, 402);

SELECT * FROM Department;
SELECT * FROM Faculty;
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Exam;
SELECT * FROM Enrollment;
SELECT * FROM Student_Exam;