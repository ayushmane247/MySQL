CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept VARCHAR(30)
);

INSERT INTO Employee VALUES (101, 'Saniya Kondekar', 25000, 'IT');
INSERT INTO Employee VALUES (102, 'Shravani Jadhav', 18000, 'HR');
INSERT INTO Employee VALUES (103, 'Viraj Navasare', 32000, 'Finance');
INSERT INTO Employee VALUES (104, 'Rohit Singh', 45000, 'IT');
INSERT INTO Employee VALUES (105, 'Nisha Rao', 15000, 'Admin');



SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE display_high_salary(min_sal IN NUMBER)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employees earning more than ' || min_sal || ':');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    FOR emp IN (SELECT * FROM Employee WHERE salary > min_sal) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || emp.emp_id || 
            ' | Name: ' || emp.emp_name || 
            ' | Salary: ' || emp.salary || 
            ' | Dept: ' || emp.dept
        );
    END LOOP;
END;
/

-- Pass your user-defined salary value (e.g., 20000)
EXEC display_high_salary(&enter_salary);
