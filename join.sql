/*Joins
*/
CREATE TABLE department(
    DepartmentID number PRIMARY KEY ,
    DepartmentName VARCHAR(20),
    salary number
);

select * from department;

insert into  department values (31, 'Sales',1200);
insert into  department values (33, 'Engineering',1300);
insert into  department values (34, 'Clerical',1500);
insert into  department values (35, 'Marketing',2000);
insert into  department values (370, 'Marketing',2000);

--------
set SERVEROUTPUT on;
CREATE TABLE employeee (
    Empid number,
    FirstName VARCHAR(20),
    DepartmentID number 
)
insert into  employeee values (1,'Rafferty', 31);
insert into  employeee values (2,'Jones', 33);
insert into  employeee values (3,'Heisenberg', 33);
insert into  employeee values (4,'Robinson', 34);
insert into  employeee values (5,'Smith', 38);
insert into  employeee values (6,'Williams', NULL);

select * from employeee;


---normal join--


select * from employeee e join department d on e.DepartmentID=d.DepartmentID;--select all from tables 
select FirstName,DepartmentName from employeee e join department d on e.DepartmentID=d.DepartmentID;

---left join
select FirstName,DepartmentName from employeee e left join department d on e.DepartmentID=d.DepartmentID;


--full outer joint
select FirstName,DepartmentName from employeee e full outer join department d on e.DepartmentID=d.DepartmentID;

