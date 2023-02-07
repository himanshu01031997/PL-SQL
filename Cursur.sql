

------------


/*Cursur

types 1.implecit--only oracle can control the implecit cusur;

attribute of implicit 
A.found 
B.notfound
C.Isopen
D.Rowcount

2.explicit- user can control the explicit cursur;*/
----------------
--(implecit)--
set SERVEROUTPUT on;
DECLARE

BEGIN 
insert into employeee values(8,'ruhi',48);
if(SQL%found) then
dbms_output.put_line('done');
else
dbms_output.put_line('not done');
end if ;
END;

select * from employeee;


-----------------
DECLARE

BEGIN 
update employeee set firstname='radhe' where empid=80;
if(SQL%found) then
dbms_output.put_line('done');
else
dbms_output.put_line('not done');
end if ;
END;

-------------------
--(explecit)--

/*
types to write explicit 
1.declare cursur
open
fetch
close
2.
cursur for loop

*/
--for loop---
set SERVEROUTPUT on;
begin 
for i in 1..5 loop
dbms_output.put_line(i);
end loop;
end;
-----------------
select * from employeee;
INSERT INTO employeee (EMPID,FIRSTNAME,DEPARTMENTID) VALUES (9,'BETU',78);

declare 
V_name employeee.FIRSTNAME%type;
 CURSOR C1 IS
 SELECT FIRSTNAME FROM employeee;
 
 BEGIN 
    OPEN C1;
    LOOP
      FETCH C1 INTO V_name;
       exit  when C1%NOTFOUND;
        dbms_output.put_line(C1%ROWCOUNT|| '-'||V_name);
    END LOOP;
    CLOSE C1;
 END;














