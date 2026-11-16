set serveroutput on;
create or replace procedure factorial(num in number) is 
fact number := 1;

BEGIN 

for i in 1..num LOOP 
fact :=fact*i;
end loop;

dbms_output.put_line('Factorial of ' || num || ' is: ' || fact);

END;
/

exec factorial(5);

