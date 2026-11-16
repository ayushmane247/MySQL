/* 5.Perform the following operations:
a.Create the following tables using DDL commands and apply suitable constraints.
Student (RollNo, Name, Class, Address)
Department (DeptId, DeptName, NoOfStudents)
*/

create database Students;
use students;

create table Student (
RollNo int primary key,
Name varchar(50) not null,
class varchar(20),
adress varchar(50)
);

create table Department(
deptID int primary key,
deptName varchar(20),
NoOfStudents int, constraint chk_students CHECK (NoOfStudents > 0)
);

-- b.Rename Student table to Student_Info
alter table Student rename to  Student_Info;

-- c.Rename column DeptName to DepartmentName
alter table Department rename column deptName to DepartmentName;

-- d.Remove all data from Department table
TRUNCATE table Department;  -- removes all records, DELETE is dml command used to delete specific data using where clause, and the action can be rolled back 

-- e.Delete the table Student_Info completely
drop table Student_Info; -- deletes the entire table 

-- f.Remove the CHECK constraint from Department table
alter table Department drop CONSTRAINT chk_students;


/*
The number inside VARCHAR defines the maximum character limit that column can 
store—so VARCHAR(20) holds up to 20 characters,
 and VARCHAR(50) holds up to 50 characters.
 
 What happens if I try to insert 25 characters into VARCHAR(20)?
	Answer: In modern SQL (strict mode), the database rejects the query and 
    throws a 'Data too long for column' error.

What is the difference between CHAR(20) and VARCHAR(20)
	Answer: CHAR(20) is fixed-length—it always reserves space for 20 characters even if I only store 5.
    VARCHAR(20) is variable-length—it only uses space for the 5 characters entered.
*/