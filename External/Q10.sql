/* 
10.For a Bank database with tables: 
Branch(branch_name, branch_city, assets), 
Loan(loan_number, branch_name, amount), 
Account(account_number, branch_name, balance), 
Depositor(customer_name, account_number)

borrower table is needed 
*/

create Database BankDatabase;
use BankDatabase;



CREATE TABLE Branch (
    branch_name VARCHAR(50),
    branch_city VARCHAR(50),
    assets DECIMAL(15,2)
);

CREATE TABLE Loan (
    loan_number INT PRIMARY KEY,
    branch_name VARCHAR(50),
    amount DECIMAL(12,2)
);

CREATE TABLE Account (
    account_number INT PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(12,2)
);

CREATE TABLE Depositor (
    customer_name VARCHAR(50),
    account_number INT
);

CREATE TABLE Borrower (
    customer_name VARCHAR(50),
    loan_number INT
);

show tables;

-- 1. Insert Branches (Includes Kolhapur for query d)
INSERT INTO Branch (branch_name, branch_city, assets) VALUES
('Rajarampuri', 'Kolhapur', 5000000.00),
('Shahupuri', 'Kolhapur', 3500000.00),
('Shivajinagar', 'Pune', 9000000.00),
('Andheri', 'Mumbai', 12000000.00);

-- 2. Insert Accounts (Includes matching balances of 25000 for query c)
INSERT INTO Account (account_number, branch_name, balance) VALUES
(101, 'Rajarampuri', 25000.00),
(102, 'Shivajinagar', 25000.00),
(103, 'Andheri', 45000.00),
(104, 'Shahupuri', 18000.00),
(105, 'Shivajinagar', 25000.00);

-- 3. Insert Depositors (Includes 'Ram' for query c, and 'Amit' who has both account & loan)
INSERT INTO Depositor (customer_name, account_number) VALUES
('Ram', 101),
('Sita', 102),
('Amit', 103),
('Priya', 104),
('Rohan', 105);

-- 4. Insert Loans (Multiple loans per branch to test SUM in query b)
INSERT INTO Loan (loan_number, branch_name, amount) VALUES
(201, 'Rajarampuri', 100000.00),
(202, 'Rajarampuri', 50000.00),
(203, 'Shivajinagar', 200000.00),
(204, 'Andheri', 300000.00);

-- 5. Insert Borrowers (Includes 'Amit' to test UNION deduplication, plus loan-only customers)
INSERT INTO Borrower (customer_name, loan_number) VALUES
('Amit', 201),
('Neha', 202),
('Vikram', 203),
('Sneha', 204);

-- a.Create a view displaying customers who have either an account or a loan.
CREATE VIEW All_Customers AS
SELECT customer_name FROM Depositor UNION 
SELECT customer_name FROM Borrower;

SELECT * FROM All_Customers;

-- b.Create a view to show sum of all loan amounts per branch.
CREATE VIEW Branch_Loan_Summary AS
SELECT branch_name, SUM(amount) AS total_loan FROM Loan
GROUP BY branch_name;

SELECT * FROM Branch_Loan_Summary;

-- c.Find customers whose balance equals that of ‘Ram’ using a subquery.
SELECT Depositor.customer_name
FROM Depositor
INNER JOIN Account
ON Depositor.account_number = Account.account_number
WHERE Account.balance IN (
    SELECT Account.balance
    FROM Depositor
    INNER JOIN Account
    ON Depositor.account_number = Account.account_number
    WHERE Depositor.customer_name = 'Ram'
);


-- d.Delete accounts of all branches located in “Kolhapur”
DELETE FROM Account
WHERE branch_name IN (
    SELECT branch_name
    FROM Branch
    WHERE branch_city = 'Kolhapur'
);

/*
VIEW -A virtual table based on a SELECT query
CREATE -VIEW	Creates a view
SUBQUERY -Query inside another query
IN -Checks whether a value matches any value in a list
DELETE -Removes records
UNION -Combines results and removes duplicates

What is a view? — A view is a virtual table based on an SQL query.
What is a subquery? — A query written inside another query.
What is the use of CREATE VIEW? — It creates a virtual table.
Can we use WHERE in a subquery? — Yes.
What is the use of IN? — It checks whether a value matches any value in a given list.
*/