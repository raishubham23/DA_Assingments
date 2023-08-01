use assignment;
-- Q.Q1 --
select * from employee;
select * from employee where deptno = 10 and salary > 3000;
-- Q.2 --
select * from students;
alter table students add column grade varchar(30);
set sql_safe_updates=0;
update students set grade="Second Class" where marks between 40 and 50;
update students set grade="First Class" where marks between 50 and 60;
update students set grade="First Class" where marks between 60 and 80;
update students set grade="Distinctions" where marks between 80 and 100;
select * from students;
select * from students where grade="First Class";
select * from students where grade="Distinctions";
-- Q.3.--
select * from station;
select distinct city,id from station where id%2=0;
-- Q.4--
select count(city) - count(distinct(city)) as "N-N1" from station;
-- Q.5--
select distinct city from station where left(city,1) in ('a','e','i','o','u');
select distinct city from station where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u');
select distinct city from station where left(city,1) not in ('a','e','i','o','u');
select distinct city from station where left(city,1) not in ('a','e','i','o','u') or right(city,1) not in ('a','e','i','o','u');
-- Q.6--
select * from emp;
select emp_no,first_name,gender,hire_date,(((CURDATE()) - (HIRE_DATE))%30) as Experience_Months,salary from emp where salary > 2000
and (((CURDATE()) - (HIRE_DATE))%30) < 36 order by salary desc;
-- Q.7--
select * from employee;
select deptno,sum(salary) as total_salary from employee group by deptno;
-- Q.8 --
select * from city;
select * from city where population > 100000;
-- Q.9 --
select sum(population) from city where district='California';
-- Q.10 --
select * from city;
select countrycode,district,avg(population) from city group by countrycode,district order by countrycode;
SELECT COUNTRYCODE, AVG(POPULATION) FROM CITY
GROUP BY COUNTRYCODE;
-- Q.11 --
select * from orders;
select * from customers;
select o.ordernumber,o.status,o.customernumber,c.customername ,o.comments
from orders as o inner join customers as c on o.customernumber=c.customernumber
 where status='Disputed';