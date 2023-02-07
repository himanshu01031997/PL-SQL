
--block types 1.annonymous  2.named block--
 
 --syntax 
 --decalration(not mandatory)
 --begin(mandatory)
 --exception(not mandatory)
 --end(mandatory)_
 ------------------------
---set SERVEROUTPUT on;(it should be in starting of queries)

--annonymous block--

set SERVEROUTPUT on;
DECLARE
VALUE1 NUMBER;
VALUE2 NUMBER;
VALUE3 NUMBER;
BEGIN 
VALUE1:=10;
VALUE2:=20;
VALUE3:=VALUE1+VALUE2;
dbms_output.put_line(VALUE3);
END;
----
--how to print in pl/sql
begin 
dbms_output.put_line('hi');
end;
------
/*2.named block
in named block no need to give declare key word*/

create or replace  procedure addmyname
as
V_empno NUMBER;
V_empname varchar(100);
V_job varchar(100);
V_salary number;
BEGIN
V_empno:=222;
V_empname:='ram';
V_job:='salesman';
V_salary:=10000;
dbms_output.put_line('empno is '||V_empno);
dbms_output.put_line('empname is '||V_empname);
dbms_output.put_line(V_job);
dbms_output.put_line(V_job);

END;

--how to execute named block
begin 
addmyname;
end;
-----------
/*Variable
1.variable name  2.variable datatype
3.variable width*/
-----------variable declaration-------
--1.declaration in declare section
declare 
V_name varchar(100):='ram';
BEGIN
dbms_output.put_line('my name is ' ||V_name);
END;
-----
--2.declare in begin section
declare 
V_name varchar(100);
BEGIN
V_name:='himanshu';
dbms_output.put_line('my name is ' ||V_name);
END;
------
--3.declare in exception section
declare 
V_name varchar(3);
BEGIN
V_name:='himanshu';
dbms_output.put_line('my name is ' ||V_name);
exception when OTHERS then
dbms_output.put_line('i am in exception section ' ||V_name);

END;
-------------
--control statements
/*
1.if statements ==>>return boolean values        2 .case statements==>>return boolean values
inside if condition further we have 4 type
A.if-(end if) only one condition
B.if-else - either if or else
C.nested-if inside if (multiple if)
D.elseif-if elsif elsif endif

A.if-(end if) using bind variable
*/
declare 
V_hindi number;
V_english number;
V_sst number;
begin 
V_hindi:= :hindi;
V_english:= :english;
V_sst:= :sst;

if V_hindi> 33 then
dbms_output.put_line('pass in hindi');
END IF;

if V_english> 33 then
dbms_output.put_line('pass in english');
END IF;

if V_sst> 33 then
dbms_output.put_line('pass in sst');
END IF;
end;


--B.if else (end if)

declare 
V_hindi number;
V_eng number;
V_sst number;
begin
V_hindi:= :hindi;
V_eng := : eng;
V_sst := :sst;
 if V_hindi>33 then
 dbms_output.put_line('passed in  hindi');
 else
 dbms_output.put_line('failed in hindi');
 end if;
 if V_eng>33 then
 dbms_output.put_line('passed in  eng');
 else
 dbms_output.put_line('failed in eng');
 end if;
 if V_sst>33 then
 dbms_output.put_line('passed in  sst');
 else
 dbms_output.put_line('failed in sst');
 end if;
 end;


-----------------------
---C.nested if condition
 
 
 declare 
 V_hindi number;
 V_sst number;
 V_eng number;
 V_total number;
 V_percent number;
 begin 
 V_hindi := :hindi;
 V_sst := :sst;
 V_eng := :eng;
 if V_hindi is not null then
      if V_sst is not null then
           if V_eng is not null then
           V_total:= V_hindi+V_sst+V_eng;
           V_percent:= V_total/3;
           dbms_output.put_line('total'||V_total ||'your percent:'||V_percent||'%');
           else dbms_output.put_line('eng is blank');
           end if;
           else dbms_output.put_line('sst is blank');
      end if;    
 else 
 dbms_output.put_line('hindi is blank');
 end if;
end;

-------------
--D.if then else condition
 
 declare 
 V_hindi number;
 V_sst number;
 V_eng number;
 V_total number;
 V_percent number;
 begin 
 V_hindi := :hindi;
 V_sst := :sst;
 V_eng := :eng;
  V_total:= V_hindi+V_sst+V_eng;
  V_percent:= V_total/3;
        if V_percent>=90 then 
        dbms_output.put_line('excellent');
        
        ELSIF V_percent>=70 and V_percent <90 then
        dbms_output.put_line('good');
        
        elsif V_percent>=40 and V_percent<70 then
        dbms_output.put_line('padhle');
        
        else 
        dbms_output.put_line('fail');
        end if;     
        end;
        
 -----------------------
  --2.case control statements:
  /*types of case control :
  A. simple case statements
  B.searched case statements
  
  syntax:A simple case statements
 --->> case selector
  when selector_value_1 then statements1;
  
  when selector_value_2 then statements2;
  else else_statements;
  end case;<<<-------
  ----------------
  syntax:B searched case statements
  --------->>
  case
  when condition_1 then statements_1
  when condition_2 then statements_2
  ----
  -
  -
  else else_statements
  end case;
  <<------
  */
  
  
  declare 
  V_grade char(1);
  begin 
  V_grade:= :grade;
  case V_grade
  when 'A' then   dbms_output.put_line('excellent');
  when 'B' then   dbms_output.put_line('v.good');
  when 'C' then   dbms_output.put_line('good');
  when 'D' then   dbms_output.put_line('average');
  else dbms_output.put_line('fail');
  end case;
  end;
  
-----------
----B searched case statements

  
 declare 
  V_grade char(1);
  begin 
  V_grade:= :grade;
  case
  when V_grade='A' then   dbms_output.put_line('excellent');
  when V_grade='B' then   dbms_output.put_line('v.good');
  when V_grade='C' then   dbms_output.put_line('good');
  when V_grade='D' then   dbms_output.put_line('average');
  else dbms_output.put_line('fail');
  end case;
  end;
  

            

 
 
 
 
 
 
 
 
 
 
 
 
 