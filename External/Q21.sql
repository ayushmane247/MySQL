-- 21.Create table Teacher(t_id, t_name, subject, salary) and perform: 

create database Teachers;
use Teachers;

create table Teacher(
t_id int primary key,
t_name varchar(20) not null,
subject varchar(20), 
salary decimal(10,2)
);

-- a. Insert 5 records.
insert into Teacher values 
(1,'Deshpande Sir','History',100000), 
(2,'Desai Mam','English',100000), 
(3,'Shinde Sir','Marathi',100000); 

-- b. Increase salary by 15% for teachers earning less than 25000. 
-- (UPDATE - Changing the values in rows,ALTER never uses a WHERE clause because it modifies the column definition for the entire table at once.)
update teacher set salary = (salary + salary*0.15) where salary<25000;
select t_name,salary from Teacher;
 
 
-- c. Delete teachers teaching “Mathematics”. 
delete from teacher where subject ='Marathi';
select * from teacher;

-- d. Display teachers earning more than 30000.
select t_name, salary from Teacher where salary> 30000;