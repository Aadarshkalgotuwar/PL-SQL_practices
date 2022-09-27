
create table n_rollcall1(RNO number,NAME varchar(50),STATUS varchar(50));

insert into o_rollcall1 values(1,'Akansha','Present');
insert into o_rollcall1 values(2,'Sakshi','Absent');
insert into o_rollcall1 values(3,'Shital','Present');
insert into o_rollcall1 values(4,'Vrushali','Absent');

insert into n_rollcall1 values(1,'Akansha','Present');
insert into n_rollcall1 values(4,'Vrushali','Absent');
select * from n_rollcall1;
#implicit cursor

begin
update o_rollcall1 set status='Absent' where rno=1;
if sql%found then
dbms_output.put_line('Updated');
end if;
if sql%notfound then
dbms_output.put_line('Not updated - not found');
end if;
if sql%rowcount=0 then
dbms_output.put_line('No rows updated');
end if;
end;
/

#for loop cursor

declare 
cursor for_cur is select rno,name,status from o_rollcall1 where STATUS='Present';
tmp for_cur%rowtype
begin
for tmp in for_cur
loop
dbms_output.put_line('ROLL NO: '|| tmp.RNO ||' '||' NAME: '|| tmp.name ||' '||' STATUS: '|| tmp.status);
end loop;
end;
/

#parameterised cursor

declare 
roll number;
cursor param_cur(roll number) is select * from o_rollcall1 where rno=roll;
begin
roll:==&roll;
for tmp in param_cur(roll) loop
dbms_output.put_line('Roll no: '||tmp.rno);
dbms_output.put_line('Name: '||tmp.name);
dbms_output.put_line('Status: '||tmp.status);
end loop;
end;
/

#merge

begin into n_rollcall1 t1 using (select rno,name,status fromm o_rollcall1) t2 on (t1.rno=t2.rno) when not found then
insert values (t2.rno,t2.name,t2.status);
if sql%rowcount>0 then
dbms_output.put_line('Merged '||sql%rowcount||' rows updated');
else
dbms_output.put_line('no rows updated');
end if;
if sql%rownotfound then
dbms_output.put_line('Not merged');
end if;
end;
/
