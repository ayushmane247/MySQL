create Database Employee;
use Employee;
create table empData(
empID int primary key,
empName varchar(20),
salary int(20)
);

select * from empData;

insert into empData 
values ('101','Ayush','10000'),
('102','Ash','100000');

update empData set  salary='10000' where empID='102';
select * from empData;

alter table empData rename column empID to employeeID;
select * from empData;

Alter table empData Drop column salary;
select * from empData;

TRUNCATE TABLE empData;
select * from empData;

DROP DATABASE Employee;
select * from empData;