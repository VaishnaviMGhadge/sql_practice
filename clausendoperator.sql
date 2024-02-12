use namastesql;

select * from Orders;

select Order_ID,Order_Date from Orders;

select top 5 * from Orders;

select Ship_Mode,Customer_Name,Ship_Date from  Orders order by Ship_Date;

select top 5 Ship_Mode,Customer_Name,Ship_Date from Orders order by Ship_Date;

select distinct Ship_Mode from Orders;

select distinct top 5* from Orders;

select distinct Order_Date,Ship_Mode from Orders;

select distinct * from Orders;


select * from Orders
where Ship_Mode='First Class';

select * from Orders
where Order_Date='2018-06-21 00:00:00.000';

select * from Orders
where Quantity=06;

select * from Orders
where Quantity>=5;

select Quantity,Region from Orders
where Quantity>=5
order by Quantity desc;

select top 50 Quantity,Region 
from Orders
where Quantity>=6
order by Quantity desc;

-- order of execution : from Orders---> where Quantity>=6---> order by  Quantity --> top 50--> column selection

select * from Orders
where Quantity!=5;

select * from Orders
where Order_Date<='2021-11-05'
order by Order_Date;


select * from Orders 
where Order_Date between '2021-10-21' and '2021-11-05' ;

select * from Orders
where Quantity between 3 and 5;


select * from Orders
where Ship_Mode in ('First Class','Same Day'); 


select * from Orders
where Quantity in (3,5);


select * from Orders
where Quantity not in (3,5,11);


select distinct Ship_Mode from Orders
where Ship_Mode>'First Class';

select distinct Ship_Mode from Orders
where Ship_Mode>'Second Class';

select * from Orders
where Ship_Mode='First Class' and Segment='Consumer';


select * from Orders
where Ship_Mode='First Class' or Segment='Consumer';

select * from Orders
where Ship_Mode='First Class' or Ship_Mode='Standard Class';

select cast(Order_Date as date) as updated_date,*
from Orders
where cast(Order_Date as date)='2020-11-08';


select *,(Profit/Sales) as Ratio, (Profit+Sales), GETDATE() as Total from Orders;


select Order_ID,Order_Date,Customer_name 
from Orders 
where Customer_Name='Claire Gute';


select * from Orders
where Customer_Name like 'C%';

select * from Orders
where Customer_Name like 'Chris%';


select * from Orders
where Customer_Name like '%t';

select * from Orders
where Customer_Name like '%ven%';


select * from Orders
where Customer_Name like 'A%a';

select Customer_Name, upper(Customer_Name) as upper_name
from Orders where upper(Customer_Name) like 'C%E';

select * from  Orders
where Customer_Name like '___c%';


select * from Orders
where Customer_Name like 'C[albo]%';

select Customer_Name from Orders
where Customer_Name like 'c_[la]%';

select * from Orders
where Customer_Name like 'C[a-h]%';

select * from Orders
where Order_ID like 'CA-202[1-2]%';


/*

1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
5- write a query to get all the orders where profit is negative (1871 rows)
6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
8- write a query to find top 5 orders with highest sales in furniture category 
9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
*/

--1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
select * from Orders
where Customer_Name like '_a_d%';

--2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 

select * from Orders
where Order_Date between '2020-12-01' and '2020-12-31';

--3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)

select * from Orders
where Ship_Mode not in('Standard Class','First Class') and Ship_Date>'2020-12-01';


--4 write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
select * from Orders
where Customer_Name not like 'A%n';

--5- write a query to get all the orders where profit is negative (1871 rows)
select * from Orders
where Profit<0;

--6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
select * from Orders
where Quantity<3 or Profit=0;

--7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
select * from Orders
where Region='South' and Discount!=0;

--8 write a query to find top 5 orders with highest sales in furniture category 

select top 5 * from Orders
where Category='Furniture'
order by Sales desc;

--9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)

select * from Orders
where (Category between 'Technology' and 'Furniture') and (Order_Date like '2020%');


--10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)

select * from Orders
where Order_Date like '2020%' and Ship_Date like '2021%';