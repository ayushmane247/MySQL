CREATE TABLE Employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    age NUMBER,
    salary NUMBER
);

INSERT INTO Employees VALUES (1, 'Amit', 25, 20000);
INSERT INTO Employees VALUES (2, 'Rahul', 32, 30000);
INSERT INTO Employees VALUES (3, 'Sneha', 22, 25000);
INSERT INTO Employees VALUES (4, 'Priya', 28, 35000);
COMMIT; 

SELECT * FROM Employees;

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT emp_id FROM Employees
        WHERE age < 30;

BEGIN
    FOR e IN c_emp LOOP

        UPDATE Employees
        SET salary = salary + 1000
        WHERE emp_id = e.emp_id;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully');

END;
/