use employee;

-- average 
select avg(salary) from empData;
select avg(salary) from empData,departments where empData.deptID = departments.deptID and departments.location ='Pune';

-- count 
select count(*) from empData;
select count(salary) from empData where salary>50000;
select count(salary) from empData where salary=0;

-- group by 

select location,count(empID) from empData,departments group by location;  
SELECT location, COUNT(empID) FROM empData JOIN departments ON empData.deptID = departments.deptID
GROUP BY location;
/* The first version doesn't actually connect the two tables, so it creates a Cartesian product. 
second explicit JOIN ... ON version is the one you should prefer.
*/


-- having clause 