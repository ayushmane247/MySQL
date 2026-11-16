/*
22.
For table Product(prod_id, prod_name, category, price) perform: 
*/

create database products;
use products;

create table Product(
prod_id int primary key,
prod_name varchar(20) not null,
category varchar(20),
price decimal(5,2)
);

INSERT INTO Product VALUES 
(1, 'Biscuits', 'Food', 35.00),
(2, 'Pasta', 'Food', 120.50),
(3, 'Laptop', 'Electronics', 950.00),
(4, 'Soda', 'Beverages', 40.00),
(5, 'Pizza', 'Food', 250.00);

-- a. Display product names in lowercase. 
select lower(prod_name) from Product;

-- b. Find products whose name ends with ‘a’. 
select prod_name from product where prod_name like '%a';

-- c. Display products whose category name contains ‘food’. 
select * from product where category ='Food';


-- d. Display number of characters in each product name using LENGTH().
select prod_name, length(prod_name) from product;