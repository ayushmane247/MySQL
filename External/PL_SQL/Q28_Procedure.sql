SET SERVEROUTPUT ON;

-- Step 1: Create the Procedure
CREATE OR REPLACE PROCEDURE calc_average_proc (
    m1 IN NUMBER,
    m2 IN NUMBER,
    m3 IN NUMBER
)
IS
    avg_marks NUMBER;
BEGIN
    avg_marks := (m1 + m2 + m3) / 3;
    DBMS_OUTPUT.PUT_LINE('The average of the three marks is: ' || ROUND(avg_marks, 2));
END;
/

-- Step 2: Execute the Procedure
EXEC calc_average_proc(85, 90, 88);
