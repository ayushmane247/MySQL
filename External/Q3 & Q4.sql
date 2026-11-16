/*
3.Create the following tables using DDL commands and apply suitable constraints. 
Student (RollNo, Name, Class, Address) 
Department (DeptId, DeptName, NoOfStudents)
*/

create database studentDB;
use studentDB;

create table students(
 RollNo int primary key,
 Name varchar(50) NOT NULL,
 Class varchar(50),
 Address varchar(50)
 );
 
CREATE TABLE Department (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    NoOfStudents INT CHECK (NoOfStudents > 0)
);


show tables;
select * from students;

DESC students;
DESC department;

/* DESCRIBE command (often shortened to DESC) is used 
in SQL to display the structure and metadata of a database table without 
returning the actual data inside it
*/


/*
4.Perform the following operations using ALTER TABLE:
a.Add a column Email to Student table
b.Change data type of Address to VARCHAR(200)
c.Add a CHECK constraint that NoOfStudents > 0
d.Remove the Email column
*/

alter table student add email varchar(20);

alter table student modify address varchar(200);

alter table department add constraint chk_constraint CHECK ( NoOfStudents > 0); 

-- alter table department add constraint chk_constraint CHECK  NoOfStudents > 0; => this will thow error, as ( ) are required 

alter table student drop column email;



