create Database Student;
use student;
create table studData(
studID int primary key,
studName varchar(20),
rno int(20)
);


select * from studData;

insert into studData values 
('101','Ayush','45'),
('102','Venky','42'),
('103','Ash','52') ;

update studData set rno='30' where studID =101;

select studName,studID from studData where studID between 101 and 102;

select studName,rno from studData where rno>50;
				
delete from studData where studName='Ash';

select * from studData;