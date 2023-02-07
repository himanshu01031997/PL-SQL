/*Exception Handling--error occured during the program execution is called exception
types of exception handling- 1.system defined 2.user defined
------->>>syntax
declare 

begin

exception 
 when exception then
  end;
  <<<-------
  
  eg of exception-zero divide ,case not found , value error,login denied, no data found,storage error
  

*/
select * from employeee;

/*set SERVEROUTPUT on;
declare 
V_name employeee.name%type;
begin
select firstname into V_name from employeee where empid=1;
dbms_output.put_line(V_name);
end;*/
set SERVEROUTPUT on
declare 
V_name employeee.FIRSTNAME%type;
BEGIN
SELECT FIRSTNAME INTO V_name from employeee where EMPID=1;
dbms_output.put_line(V_name);
exception
when no_data_found then
dbms_output.put_line('no data found');
when others then
dbms_output.put_line('other exception occured');
END;













