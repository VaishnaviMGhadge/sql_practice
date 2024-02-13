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



Update Orders
set City=Null 
where Order_ID in('CA-2020-152156','US-2019-108966');


select * from Orders
where Order_ID in('CA-2020-152156','US-2019-108966');

select * from Orders
where City is NULL;

-- null is not comparable
select * from Orders
where City is not null;


---aggregation --- combining the data

select count(*) as cnt,
sum(Sales) as addition,
min(Profit) as min_profit,
max(Profit) as max_profit,
avg(Sales) as avg
from Orders;
















