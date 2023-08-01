use assignment;
-- Q1---
/* CREATE DEFINER=`root`@`localhost` PROCEDURE `new_order_placed`(Year int,Month int)
BEGIN
select ordernumber,orderdate,status from orders
where year(orderdate)=year and month(orderdate)=month;
END */
call assignment.new_order_placed(2003, 4);

-- Q2(a) I have write a function for payments table*/
select * from payments;
Set global log_bin_trust_function_creators=1;

/*CREATE DEFINER=`root`@`localhost` FUNCTION `new_function_purchase_status`(customer_id integer) RETURNS varchar(225) CHARSET utf8mb4
BEGIN
declare purchase_status varchar(225);
select if(sum(amount)>50000,"Platinum",if(sum(amount) between 25000 and 50000,"Gold","Silver"))
into purchase_status from payments where customernumber=customer_id;
RETURN purchase_status;
END*/
select assignment.new_function_purchase_status(103);

/* Q.2(b) Write a query that displays customerNumber, customername and purchase_status from customers and orders table.*/
select * from orders;
select * from customers;
select c.customerNumber,c.customername,o.status as purchase_status 
from customers as c inner join orders as o
on c.customerNumber=o.customerNumber;

/* Q.3. using triggers on movies and rentals tables. */
select * from movies;
select * from rentals;
 set sql_safe_updates=0;
 
 -- Delete Trigger --
/*CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_DELETE` 
AFTER DELETE ON `movies` FOR EACH ROW
 BEGIN
	delete from rentals
    where id=movieid;
END */

-- Update trigger --
/* CREATE  TRIGGER `movies_AFTER_UPDATE` 
AFTER UPDATE ON `movies` 
FOR EACH ROW BEGIN
	update rentals 
	set movieid=id
	where id = new.id;
END */
select * from movies;

-- Q.4.Select the first name of the employee who gets the third highest salary. [table: employee] --
with e as (select fname,salary,dense_rank() over (order by salary desc) as rnk from employee)
select * from e where e.rnk=3;

-- Q.5.Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee] --
select *,dense_rank() over (order by salary desc) as salary_rnk from employee;


