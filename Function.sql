/* Function in pl/sql
--->>
syntax:
 create[or replace] function function_name[parameter]
 [(parameter_name[in|out| in out] type[])]
 return return_datatype
 {is|as}
 begin 
  
  end [funtion_name]

*/

--create one tabal with name customer
create table customer(
Id number,
name varchar(10),
age number,
salary number
)

insert into customer(Id,name,age,salary) values(1,'rahul',12,10000);
insert into customer(Id,name,age,salary) values(2,'rama',12,10000);
insert into customer(Id,name,age,salary) values(3,'betu',12,10000);
insert into customer(Id,name,age,salary) values(4,'vaisa',12,10000);
insert into customer(Id,name,age,salary) values(5,'nakul',12,10000);


select * from customer;

----function
create or replace function gettotalcustomer
return number
is
V_Count number:=0;
begin 
select count(*) into V_Count from customer;
return V_count;
end;


----how to call function
begin
dbms_output.put_line(gettotalcustomer());
end;