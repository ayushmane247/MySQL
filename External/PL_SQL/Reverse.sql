SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE reverse_num(n IN NUMBER) 
IS
BEGIN 
    FOR i IN REVERSE 1..n LOOP
        DBMS_OUTPUT.PUT(i || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/

-- Execute it:
EXEC reverse_num(5);


/*
Important: You must include DBMS_OUTPUT.NEW_LINE; 
(or DBMS_OUTPUT.PUT_LINE('');) after the loop, 
otherwise Oracle keeps the line buffered and nothing appears on your screen.
*/

