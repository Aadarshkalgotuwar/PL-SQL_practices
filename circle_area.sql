/* create table circle (rad integer, area float);
select * from circle;

declare
 area number(5,2);
 rad number;

begin
 for rad in 5..9
loop
 area:=3.14*rad*rad;
 insert into circle values(rad , area);
end loop;
end;
*/

declare
 area number(5,2);
 rad number:=5;

begin
 while rad<=9
loop
 area:=3.14*rad*rad;
 insert into circle values(rad , area);
 rad:=rad+1;
end loop;
end;
/

/*
create table circle1 (rad integer, area float);
select * from circle1;
*/
declare 
area number(5,2);
n number:=&n;
rad number:=&rad;
begin
for rad in n
loop
 area:= 3.14*rad*rad;
 insert into circle1 values(rad ,area);
end loop;
end;
/
