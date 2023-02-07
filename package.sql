/*Package in pl/sql
Components of package :-- are a.package specification
                              b.package body
                              
a.specification consisit of all the public variables , cursur ,objects,function,exceptions
--->>> syntax

create[or replace] pakage <pakagename>
is
<sub program and public element declaration>
end <package name>;
<<<----------
b.Pakage body
------>>syntax
create [or replace ] package body
<package_name>
is 
<global_declaration part >
<private and public element definition>
<package initialization>
end <package name>;

*/
select * from employeee;

set SERVEROUTPUT on;
--defining package specification
create or replace package package_emp
as
procedure insert_emp(empid in number,firstname in varchar2,departmentid in number);
procedure delete_emp(delete_id in number);
function add_num(n1 in number,n2 in number)
return number;
end ;

------------------------
--defining package body
--------------------------
create or replace package body package_emp
as

procedure insert_emp(empid in number,firstname in varchar2,departmentid in number)
is 
begin 
insert into employeee values(empid,firstname,departmentid); 
end insert_emp;

procedure delete_emp(delete_id in number)
is 
begin
delete from employeee where departmentid=delete_id;
end delete_emp;

function add_num(n1 in number,n2 in number)
return number
is 
n3 number;
begin 
n3:=n1+n2;
return n3;
end add_num;
end package_emp;
---------------
---------
---------------
--how to call package 
set serveroutput on;
begin 
package_emp.insert_emp(12,'wilsonnn',34);
end;

select * from employeee;

