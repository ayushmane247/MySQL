-- 8.Create table Account(acc_no, branch_name, balance) and perform:

CREATE DATABASE bankDB;
USE bankDB;

CREATE TABLE Account (
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(20) NOT NULL,
    balance DECIMAL(10, 2) CHECK (balance >= 0)
);

INSERT INTO Account VALUES
(101, 'Kolhapur', 15000.00),
(102, 'Kolhapur', 12000.00),
(103, 'Pune', 25000.00),
(104, 'Mumbai', 9000.00),
(105, 'Pune', 8000.00);

-- a.Find total balance at each branch.
select branch_name, SUM(balance) from account group by branch_name;

-- b.Find average balance of all accounts.
select AVG(balance) from account;

-- c.Display branches having total balance > 20000.  ( cannot use WHERE with aggregate functions like SUM(balance) > 20000, Use Having clause) 
SELECT branch_name, SUM(balance) AS total_balance
FROM Account
GROUP BY branch_name
HAVING SUM(balance) > 20000;

-- d.Sort account details in descending order of balance.
SELECT * FROM Account ORDER BY balance DESC;

/*
Aggregate functions
Function	Purpose
SUM()	Calculates total
AVG()	Calculates average
COUNT()	Counts records
MAX()	Finds maximum value
MIN()	Finds minimum value

WHERE:
Filters individual rows
Used before GROUP BY
Cannot directly filter aggregate results

HAVING:
Filters groups
Used after GROUP BY		
Can filter aggregate results
*/
