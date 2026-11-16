-- 7.For table Customer(cust_id, cust_name, city, phone), perform following:

CREATE database customersDB;
use customersDB;

create table Customer (
cust_id int primary key,
cust_name varchar(20) not null,
city varchar(20),
phone VARCHAR(10) UNIQUE CHECK (LENGTH(phone) = 10)
); 

insert into customer values
(1, 'Amit', 'Kolhapur',1234567890 ),
(2, 'Rahul', 'Sangli', 2345678901),
(3, 'Priya', 'Pune', 3456789012);



-- a.Display customer names in uppercase.
select UPPER(cust_name) from customer;

-- b.Find customers whose name starts with ‘S’.
select * from customer where cust_name like 'A%';  -- for now , take A 

-- c.Display customers whose city name contains ‘pur’.
select * from customer where city LIKE '%pur%';

-- d.Count length of each customer name using LENGTH() function.
select cust_name, length(cust_name) from customer;


/*

UPPER()	Converts into uppercase	UPPER('ram') → RAM
LOWER()	Converts into lowercase	LOWER('RAM') → ram
LENGTH()	Returns string length	LENGTH('Ayush') → 5
LIKE	Searches for a pattern	LIKE 'S%'

Most important: LIKE wildcards
% = Zero or more characters.
_ = Exactly one character.

*/
