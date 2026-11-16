CREATE DATABASE IF NOT EXISTS collegeDB;
USE collegeDB;

CREATE TABLE IF NOT EXISTS Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(20)
);

INSERT INTO Student VALUES 
(1, 'Amit', 'TY AI-ML'),
(2, 'Ayush', 'SY AI-ML'),
(3, 'Rohan', 'TY AI-ML');

