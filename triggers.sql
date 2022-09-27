create table library(stud_id int primary key,stud_name varchar(20),name_of_book varchar(20),status varchar(20));
insert into library values(1,'aadarsh','DSA','Issue');
insert into library values(2,'rehman','Java','Return');
insert into library values(3,'Sakshi','Python','Return');
insert into library values(4,'santosh','TOC','Issue');
insert into library values(5,'vijaya','CNS','Return');
select * from library;
create table lib_audit(rollno int,name varchar(20),cdate date,action varchar2(20));
desc lib_audit;
create or replace trigger lib_insert
after insert on library 
for each row
begin insert into lib_audit values
(:new.stud_id,
:new.stud_name,
sysdate,
'insert');
end;
/*insert into library values(6,'Vaishnavi','MP','Issue');*/

