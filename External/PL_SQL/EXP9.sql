CREATE TABLE Student (
    Roll_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(255),
    Class VARCHAR(20)
);

INSERT INTO Student VALUES
(1, 'Amit', 'Kolhapur', 'TY');

INSERT INTO Student VALUES
(2, 'Rahul', 'Pune', 'SY');

INSERT INTO Student VALUES
(3, 'Sneha', 'Mumbai', 'TY');


SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE display_students
IS
BEGIN
    FOR s IN (SELECT * FROM Student) LOOP

        DBMS_OUTPUT.PUT_LINE('Roll No: ' || s.Roll_no);
        DBMS_OUTPUT.PUT_LINE('Name: ' || s.Name);
        DBMS_OUTPUT.PUT_LINE('Address: ' || s.Address);
        DBMS_OUTPUT.PUT_LINE('Class: ' || s.Class);

        DBMS_OUTPUT.PUT_LINE('----------------');

    END LOOP;
END;
/

EXEC display_students;