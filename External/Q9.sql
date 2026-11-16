/*
9.Given tables:
Borrower(customer_name, loan_number)
Depositor(customer_name, account_number)
Account(account_number, branch_name, balance)
*/

create database Accounts;
use accounts;

CREATE TABLE Borrower (
    customer_name VARCHAR(50),
    loan_number INT
);

CREATE TABLE Depositor (
    customer_name VARCHAR(50),
    account_number INT
);

CREATE TABLE Account (
    account_number INT PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(12,2)
);

INSERT INTO Borrower VALUES
('Amit', 101),
('Rahul', 102),
('Sneha', 103);

INSERT INTO Depositor VALUES
('Amit', 201),
('Rahul', 202),
('Rohan', 203);

INSERT INTO Account VALUES
(201, 'Shahupuri', 15000),
(202, 'Kolhapur', 20000),
(203, 'Shahupuri', 25000);

-- a.Display customers who have both account and loan. (INNER JOIN returns matching records from both tables)
SELECT Depositor.customer_name 
FROM Depositor INNER JOIN Borrower ON Depositor.customer_name = Borrower.customer_name;

SELECT * FROM Depositor INNER JOIN Borrower ON Depositor.customer_name = Borrower.customer_name;


-- b.Display customers having account but not loan. (NOT IN excludes customers present in the Borrower table.)
select * from Depositor where customer_name NOT IN 	(
 select customer_name from Borrower 
);


-- c.List all customers with either account or loan or both.
SELECT customer_name FROM Depositor UNION SELECT customer_name FROM Borrower;

-- d.List customers who have account in branch “Shahupuri”.
SELECT Depositor.customer_name FROM Depositor INNER JOIN Account
ON Depositor.account_number = Account.account_number
WHERE Account.branch_name = 'Shahupuri';

SELECT * FROM Depositor INNER JOIN Account
ON Depositor.account_number = Account.account_number
WHERE Account.branch_name = 'Shahupuri';

/*

JOIN -Combines records from multiple tables
INNER -JOIN	Returns matching records
UNION -Combines results and removes duplicates
UNION ALL -Combines results and keeps duplicates
NOT IN -Excludes matching values
ON -Specifies the joining condition

What is JOIN? — It combines records from two or more tables.
What is INNER JOIN? — It returns matching records from both tables.
What is UNION? — It combines results of two SELECT statements and removes duplicates.
Difference between UNION and UNION ALL? — UNION removes duplicates; UNION ALL keeps them.
What is a Cartesian product? — It combines every row of one table with every row of another table
*/