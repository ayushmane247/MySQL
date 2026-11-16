/*
25.
For an E-commerce database with tables: 
Seller(seller_id, name, city, rating) 
Product(prod_id, seller_id, price) 
Customer(cust_id, cust_name, city) 
Order_Info(order_id, prod_id, cust_id, quantity) 
Perform: 
a. Create a view showing customers and sellers in the same city. 
b. Create a view showing total revenue per seller. 
c. Find customers who have ordered the same quantity as customer “Rohan”. 
d. Delete all sellers located in city “Pune”.
*/

CREATE DATABASE Ecom;
USE Ecom;

-- 1. Create Tables
CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    name VARCHAR(30),
    city VARCHAR(30),
    rating DECIMAL(3,1)
);

CREATE TABLE Product (
    prod_id INT PRIMARY KEY,
    seller_id INT,
    price DECIMAL(10,2)
);

CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(30),
    city VARCHAR(30)
);

CREATE TABLE Order_Info (
    order_id INT PRIMARY KEY,
    prod_id INT,
    cust_id INT,
    quantity INT
);

-- 2. Insert Minimal Sample Data (3-4 rows each is enough)
INSERT INTO Seller VALUES 
(1, 'TechWorld', 'Kolhapur', 4.5),
(2, 'PuneShop', 'Pune', 4.2),
(3, 'MetroStore', 'Mumbai', 4.8);

INSERT INTO Product VALUES 
(101, 1, 500),
(102, 2, 1000),
(103, 3, 800);

INSERT INTO Customer VALUES 
(201, 'Rohan', 'Kolhapur'),
(202, 'Amit', 'Kolhapur'),
(203, 'Sneha', 'Pune');

INSERT INTO Order_Info VALUES 
(301, 101, 201, 3),
(302, 102, 202, 3),
(303, 103, 203, 2);

-- a. View: Customers and sellers in the same city
CREATE VIEW Same_City AS
SELECT c.cust_name, s.name, c.city
FROM Customer c
JOIN Seller s ON c.city = s.city;

SELECT * FROM Same_City;

-- b. View: Total revenue per seller
CREATE VIEW Seller_Rev AS
SELECT s.name, SUM(p.price * o.quantity) AS revenue
FROM Seller s
JOIN Product p ON s.seller_id = p.seller_id
JOIN Order_Info o ON p.prod_id = o.prod_id
GROUP BY s.name;

SELECT * FROM Seller_Rev;

-- c. Customers who ordered the same quantity as "Rohan"
SELECT c.cust_name
FROM Customer c
JOIN Order_Info o ON c.cust_id = o.cust_id
WHERE o.quantity IN (
    SELECT o.quantity 
    FROM Order_Info o
    JOIN Customer c ON o.cust_id = c.cust_id
    WHERE c.cust_name = 'Rohan'
);

-- d. Delete all sellers located in city "Pune"
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Seller WHERE city = 'Pune';
SELECT * FROM Seller;
