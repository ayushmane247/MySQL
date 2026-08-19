use employee;
/*
1. What is a subquery? => A subquery is simply a SQL query written inside another SQL query.
Think of it as:
First solve a smaller question → use that result to solve the main question.

For example, suppose I ask:
“Find employees whose salary is greater than the average salary.”

There are really two questions hidden inside that English sentence:
1. What is the average salary?
2. Which employees have salary greater than that average?

OUTER QUERY
    |
    |-- WHERE salary >
    |
    └── INNER QUERY
          SELECT AVG(salary)
          FROM empData
*/


-- scalar subqueries.: Find the employees whose salary is greater than the average salary of all employees.

select empName,salary from empData where salary > (
select avg(salary) from empData); -- avg = 56,000

-- Find the employee(s) who earn the maximum salary.
-- select empName,max(salary) from empData;

select empName,salary from empData where salary = (
select max(salary) from empData
);

/*
IN subquery : But a subquery doesn't have to return one value.
It can return multiple values.

NOT IN with Subquery:

The subquery returns a LIST of values.
The outer query keeps rows whose value is NOT present in that list.

Think:
IN     → value is present in the list
NOT IN → value is absent from the list
*/

-- Find employees who work in a department located in Pune
select empName,deptID from empData where deptID IN(  -- checks 10, 40 deptID and prints empName according to that 
 select deptID from departments where location ='Pune'  -- returns 10,40 as deptIDs that are in Pune 
);

-- NOT IN : Keep employees whose deptID is not 10 AND not 40.
select empName,deptID from empData where deptID NOT IN(  -- checks 10, 40 deptID and prints empName according to that 
 select deptID from departments where location ='Pune'  -- returns 10,40 as deptIDs that are in Pune 
);


-- Find employees who do not work in the HR department.
select empName,deptID from empData where deptID NOT IN (
select deptID from departments where deptName = 'HR'
);

-- Find employees who do not work in departments located in Pune.
select empName,deptID from empData where deptID NOT IN (
 select deptID from departments where location = 'Pune'
);

/*

*/

-- Find employees whose salary is greater than at least one salary among IT employees.
SELECT empName, salary FROM empData WHERE salary > ANY (
    SELECT salary FROM empData WHERE deptID = (
        SELECT deptID FROM departments WHERE deptName = 'IT')
);

select empName,salary from empData where salary > any (
 select salary from empData where deptID =10);
 
-- Find employees whose salary is greater than at least one employee in the HR department.
select empName,salary,deptName from empData join departments on empData.deptID = departments.deptID WHERE salary > ANY (
 select salary from empData where deptID= 20);
 
 -- Find employees who earn less than at least one employee in the IT department.
 select empName,salary,deptName from empData join departments on empData.deptID = departments.deptID where salary < any (
 select salary from empData where deptID =10 );
 
 -- The HR team wants to identify employees whose salary is at least as high as an HR employee's salary.
 select empName,salary,deptName from empData join departments on empData.deptID = departments.deptID WHERE salary >= ANY (
 select salary from empData where deptID= 20);
 
 -- Management wants to find employees whose salary is higher than at least one employee
 -- working in Finance. Display the employee name, salary, and department name.
 
 select empName,salary,deptName from empData join departments on empData.deptID = departments.deptID WHERE salary > ANY (
  select salary from empData where deptID= 30);
  
  -- A manager wants to identify employees whose salary is lower than at least one employee working in HR or IT. 
  -- Display the employee name, salary, and department name.
  select empName,salary,deptName from empData join departments on empData.deptId = departments.deptID where salary < any (
    select salary from empData where deptID = 10 or deptID = 20);
    
  