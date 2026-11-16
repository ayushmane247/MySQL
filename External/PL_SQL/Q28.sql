-- Step 1: Create the Function
CREATE OR REPLACE FUNCTION calc_average (
    m1 IN NUMBER,
    m2 IN NUMBER,
    m3 IN NUMBER
) RETURN NUMBER
IS
    avg_marks NUMBER;
BEGIN
    avg_marks := (m1 + m2 + m3) / 3;
    RETURN ROUND(avg_marks, 2);
END;
/

-- Step 2: Call the Function and Display Output using DBMS_OUTPUT
SET SERVEROUTPUT ON;

DECLARE
    mark1  NUMBER := 85;
    mark2  NUMBER := 90;
    mark3  NUMBER := 88;
    result NUMBER;
BEGIN
    result := calc_average(mark1, mark2, mark3);
    DBMS_OUTPUT.PUT_LINE('The average of the three marks is: ' || result);
END;
/

SELECT calc_average(1,2,3) FROM dual;