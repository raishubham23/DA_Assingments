create database assignment;
use assignment;

-- Q-3) Create a table called countries with the following columns name, population, capital
create table countries(
name varchar(30),
population integer,
capital varchar(30));
insert into countries values('China' ,1382,'Beijing'),('India',1326,'Delhi'),('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),('Brazil',209,'Brasilia'),('Pakistan',193,'Islamabad'),('Nigeria',187,'Abuja'),('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),('Mexico',128,'Mexico City'),('Japan',126,'Tokyo'),('Philippines',102,'Manila'),('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),('Egypt',93,'Cairo'),('Germany',81,'Berlin'),('Iran',80,'Tehran'),('Turkey',79,'Ankara'),('Congo',79,'Kinshasa'),
('France',64,'Paris'),('United Kingdom',65,'London'),('Italy',60,'Rome'),('South Africa',55,'Pretoria'),('Myanmar',54,'Naypyidaw');
select * from countries;

-- Q-3 (b) Add a couple of countries of your choice--
insert into countries values('Sri Lanka' ,222, 'Colombo'),('South Koriea', 517,'Seoul'),('Netherland',175 ,'Amsterdam');

-- Q-3-(c) Change ‘Delhi' to ‘New Delhi'--
set sql_safe_updates=0;
update countries set capital="New Delhi" where name="India";

-- Q-4. Rename the table countries to big_countries -- 
alter table countries rename big_countries;
select * from big_countries;

-- Q-5. Create the following tables. Use auto increment wherever applicable
create table suppliers(
supplier_id integer primary key auto_increment,
supplier_name varchar(50),
location varchar(225));
desc suppliers;
insert into suppliers values(101,"Shubham Kumar rai","BTM 1ST Stage,Bangalore,Karnataka"),
(102,"Kushal Kumar Shukla","Maitri Nagar,Bhilai,Chhattisgarh"),
(103,"Someshwar Tripathi","Srinagar Colony,Telangana,Hyderabad"),
(104,"Pawan","Marathahali,Bangalore,Karnataka"),
(105,"Vivek Shah","Maroda Sector,Bhilai,Chhattisgarh"),
(106,"Jacky","Mishra Colony,Kharsiya,Chhattisgarh"),
(107,"Tikesh Verma",",Utai Nagar,Bhilai,Chhattisgarh");
select * from suppliers;

create table product(
product_id integer primary key auto_increment,
product_name varchar(50),
supplier_id integer,
foreign key(supplier_id) references suppliers(supplier_id)
on delete cascade
on update cascade);
insert into product values(1,"Pen Drive",101),(2,"Ear Phone",102),(3,"Mouse",103),
(4,"Laptop",104),(5,"Desktop",105),(6,"Mobile Phone",106),(7,"Water Heater",107);
desc product;
select * from product;

create table stock(
id integer primary key auto_increment,
product_id integer,
balance_stock integer,
foreign key(product_id) references product(product_id)
on delete cascade
on update cascade);
desc stock;
insert into stock values(2001,1,2990),(2002,2,1678),(2003,3,2340),(2004,4,2300),(2005,5,1780),(2006,6,2894),(2007,7,940);
select * from stock;

-- Q.7.. Modify the supplier table to make supplier name unique and not null.--
alter table suppliers modify column supplier_name varchar(50) unique not null;
desc suppliers;

-- Q8.Modify the emp table as follows
select * from emp;
alter table emp add column deptno integer;
update emp set deptno=20 where emp_no%2=0;
update emp set deptno=30 where emp_no%3=0;
update emp set deptno=40 where emp_no%4=0;
update emp set deptno=50 where emp_no%5=0;
update emp set deptno=10 where emp_no%2 and 3 and 4 and 5 != 0;

-- Q.9. Create a unique index on the emp_id column.--
create unique index u_index on emp(emp_no);
desc emp;
show index from emp;

-- Q.10. Create view called emp_sal on the emp table --
create view emp_sal as select emp_no,first_name,last_name,salary from emp order by salary desc;
select * from emp_sal;
select * from emp;
