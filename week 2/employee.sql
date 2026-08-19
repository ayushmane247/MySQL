create Database Employee;
use employee;
create table empData(
empID int primary key,
empName varchar(20),
salary int(20)
);

CREATE TABLE departments (
    deptID INT PRIMARY KEY,
    deptName VARCHAR(20),
    location VARCHAR(20)
);

alter table empdata add deptID int;

select * from empData;

INSERT INTO departments values 
(10, 'IT', 'Pune'),
(20, 'HR', 'Mumbai'),
(30, 'Finance', 'Delhi'),
(40, 'Sales', 'Pune');

INSERT INTO empData VALUES
(101, 'Ayush', 50000, 10),
(102, 'Ash',   60000, 20),
(103, 'Raj',   70000, 10),
(104, 'Neha',  45000, 30),
(105, 'Aman',  55000, 40);

select * from empData;
select * from departments;

select empName, salary from empData;
select empName from empData where salary >50000;

-- names and salaries of employees whose salary is at least 50,000.--  
select empName,salary from empData where salary >=50000;

-- Display the employee names and salaries of all employees, starting from the highest salary to the lowest salary
select empName, salary from empData order by salary desc;

-- Display all the different locations where departments are located, without repeating a location
select distinct location from departments;

-- Find the employees whose salary is between 50,000 and 60,000, inclusive 
select empName from empData where salary >=50000 and salary <=60000;
SELECT empName FROM empData WHERE salary BETWEEN 50000 AND 60000;

select empName from empData where empName like 'A%';
select empName from empData where empName like '%n';
select empName from empData where empName like '%sh%';

-- employee names and salaries whose salary is between 45,000 and 60,000 inclusive, and display them from highest salary to lowest.
select empName, salary from empData where salary between 45000 and 60000 order by salary desc;

/*
*/

-- set oprations 
SELECT DISTINCT s.salary
FROM empData AS s, empData AS s1
WHERE s.salary < s1.salary;

-- null values 
select empName from empData where salary is null;