use Employee;
-- Find the names of employees who belong to department 10 AND have a salary greater than 50,000.
select empName from empData where deptID =10 and salary >50000;
 
-- Find the names of employees who belong to department 10 OR department 30.
select empName from empData where deptID =10 OR deptID=30;

-- Find the names and salaries of employees whose name starts with A and whose salary is greater than 50,000
select empName,salary from empData where empName like 'A%' and salary >50000;

-- implicit join style.
-- Display each employee's name and department name => What connects them? empData.deptID = departments.deptID
SELECT empName,deptName FROM empData, departments WHERE empData.deptID = departments.deptID;


-- Display the employee name, salary, and department name for every employee.
SELECT empName,salary,deptName 	FROM empData,departments WHERE empData.deptID = departments.deptID;

-- Display the employee name and department name for employees working in Pune
SELECT empName,deptName,location FROM empData,departments WHERE empData.deptID = departments.deptID and location='Pune';
SELECT empName,deptName,location FROM empData,departments where (empData.deptID,location) = (departments.deptID, 'Pune');

-- Display the employee name and salary of employees working in the IT department.
SELECT empName,salary,location FROM empData,departments WHERE deptName='IT' and empData.deptID = departments.deptID;

-- Display the employee name, department name, and location for employees whose salary is greater than 50,000.
SELECT empName, deptName,location FROM empData,departments WHERE salary > 50000 and empData.deptID = departments.deptID;

/* 
Explicit INNER JOIN 
FROM course INNER JOIN prereq
ON course.course_id = prereq.course_id */

SELECT empName, salary, deptName FROM empData 
INNER JOIN departments on empData.deptID = departments.deptID;

/*
Implicit JOIN: tables are listed together in FROM, and the matching condition is written in WHERE.

Explicit JOIN: the word JOIN is written explicitly, and the matching condition is written in ON
*/

-- Employees earning more than ₹50,000, along with their department names.
SELECT empName,deptName,salary FROM empData INNER JOIN departments ON empData.deptID = departments.deptID 
order by salary desc;

