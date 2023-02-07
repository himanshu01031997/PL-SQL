/*
Direct insert: .082 sec
forloop- .084 sec
for all loop-.051 sec
fetch limit- .106 sec
*/


set SERVEROUTPUT on;
declare
I_start number default dbms_utility.get_time;
begin
insert into inventorylist
select * from inventories;
commit;
dbms_output.put_line(round((dbms_utility.get_time- I_start)/100,2)||'seconds');
end;

-------------------------------------------------
select * from inventories;

create table inventorylist(
productid number,
warehouseid number,
quantity number
)

---------------------------------------------------
declare
cursor c1 is
select product_id, warehouse_id, quantity from inventories;
I_start number default dbms_utility.get_time;
begin
for i in c1
loop
insert into inventoryList values(i.product_Id,i.warehouse_id,i.quantity);
end loop;
commit;
dbms_output.put_line(round((dbms_utility.get_time- I_start)/100,2)||'seconds');

end;
-----------------------------------------------
declare
cursor c1 is
select product_id, warehouse_id, quantity from inventories;
type tp is table of inventories%rowtype;
I_tp tp:=tp();
I_start number default dbms_utility.get_time;
begin
for i in c1
loop
I_tp.extend;
I_tp(I_tp.last).product_id:=i.product_id;
I_tp(I_tp.last).warehouse_id:=i.warehouse_id;
I_tp(I_tp.last).quantity:=i.quantity;
end loop;
forall i in 1..I_tp.count save exceptions
insert into inventoryList values I_tp(i);
commit;
dbms_output.put_line(round((dbms_utility.get_time- I_start)/100,2)||'seconds');

end;
--------------------------------
declare
cursor c1 is
select product_id, warehouse_id, quantity from inventories;
type tp is table of inventories%rowtype;
I_tp tp:=tp();
I_start number default dbms_utility.get_time;
begin
open c1;
loop
fetch c1 bulk collect into I_tp limit 10000;
exit when I_tp.count=0;
forall i in 1..I_tp.count save exceptions
insert into inventoryList values I_tp(i);
commit;
end loop;
dbms_output.put_line(round((dbms_utility.get_time- I_start)/100,2)||'seconds');
close c1;
end;