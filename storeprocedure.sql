 /*StoreProcedure
-->>syntax
 create[or replace] procedure procedure_name
 [(parameter [parameter])
 is
 [declaration part]
 ]*/
 set SERVEROUTPUT on;
 create or replace procedure myfirstproc
 is
 begin
 dbms_output.put_line('hello bro');
  dbms_output.put_line('hello bro');
 end;

-----to execute procedure
execute myfirstproc;
---to drop procedure
drop procedure myfirstproc;

--create table
create table mytable(
id number,
name varchar(10))

select * from mytable;

--insert value into table

insert into mytable (id,name) values (1,'ram');

----store procedure with parameter

create or replace procedure insertdetails
(V_id number,
V_name VARCHAR2
)
is 
begin
insert into mytable(id,name) values (V_id,V_name);
end;

execute insertdetails(2,'james');

----------------------------
--out parameter 
create or replace procedure findmax
(V_X number,
V_Y number,
V_Z out number)
is 
begin
if(V_X>V_Y)then
V_Z := V_X;
else
V_Z := V_Y;
end if;
end;


declare 
Z int;
begin
 findmax(100,200,Z);
 dbms_output.put_line('max value is' ||Z);
 end;
---------------------