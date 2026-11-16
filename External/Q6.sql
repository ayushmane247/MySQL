-- 6.Insert, update, delete, and display records from a table Employee(emp_id, name, salary, designation). Examples:

create database EmployeeDB;
use EmployeeDB;

CREATE TABLE Employee (
    emp_id int PRIMARY KEY,
    name VARCHAR(50),
    salary int,
    designation VARCHAR(30)
);

-- a.Insert 5 employee records.
insert into Employee values 
(1, 'Amit', 12000, 'Clerk'),
(2, 'Rahul', 25000, 'Manager'),
(3, 'Priya', 14000, 'Developer'),
(4, 'Sneha', 30000, 'Analyst'),
(5, 'Rohan', 18000, 'Clerk');

select * from employee;

-- b.Increase salary by 10% for employees earning less than 15000.
set SQL_SAFE_UPDATES=0;

update employee SET salary =(salary + salary * 0.10) where salary < 15000;

-- c.Delete employees having designation “Clerk”.
delete from employee where designation = 'Clerk';

set SQL_SAFE_UPDATES=1;

-- d.Display employees whose salary > 20000.
select name,salary from employee where salary > 20000;


/*
MySQL Workbench enables Safe Update Mode by default, 
which blocks UPDATE or DELETE queries that don't filter using a PRIMARY KEY. 
I can safely bypass it for this session using SET SQL_SAFE_UPDATES = 0;.


What is COMMIT?	Permanently saves the current transaction changes
*/