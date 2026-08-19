/*
Management wants to identify employees whose salary is higher than every employee in the IT department. 
Display the employee name, salary, and department name.

-- Empty result set, Not technically a NULL value.
No matching rows = empty result set
NULL = a row/value exists, but the value is unknown/missing
*/

use employee;
select empName,salary,deptName from empData join departments on empData.deptID = departments.deptID where salary > ALL (
  select salary from empData where deptID =10);  
  
-- The Finance manager wants to identify employees whose salary is lower than every employee in the IT department.

select empName,salary from empData where salary < all (
 select salary from empData where deptID =10);
  
select empName,salary from empData where salary < 50000; -- as 50,000 is the lowest salary in IT dept

-- Find employees whose salary is greater than or equal to every employee in the HR department
select empName,salary from empData where salary >=  60000;


-- Exists 
-- Find the names of employees whose department exists in the departments table.
select empName from empData where exists ( 
   select deptName from departments );
   
-- Find employees whose department exists in the departments table and is located in Pune.
select empName,location,deptName from empData join departments on empData.deptID = departments.deptID where exists ( 
   select location from departments where location ='Pune' );
   
-- Find employees whose department does not exist in Pune.
select empName,location,deptName from empData join departments on empData.deptID = departments.deptID where exists( 
   select deptID from departments where not exists (
   select location from departments where location ='Pune') );
 