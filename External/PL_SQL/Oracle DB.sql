CREATE OR REPLACE PROCEDURE GetStudentDetails (
    p_StudentID IN NUMBER
)
IS
    v_FirstName Students.FirstName%TYPE;
    v_LastName  Students.LastName%TYPE;
    v_City      Students.City%TYPE;
BEGIN
    SELECT FirstName, LastName, City
    INTO v_FirstName, v_LastName, v_City
    FROM Students
    WHERE StudentID = p_StudentID;

    DBMS_OUTPUT.PUT_LINE(v_FirstName || ' ' || v_LastName || ' - ' || v_City);
END;
/