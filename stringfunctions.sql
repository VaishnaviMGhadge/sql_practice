use namastesql;


select * from employee;

select dept_id,STRING_AGG(emp_name,',')within group(order by salary) as 'list of employees'
from employee
group by dept_id

select manager_id,STRING_AGG(emp_name,' ') as 'employee'
from employee
group by manager_id;


select e1.manager_id,e2.emp_name
from employee e1
inner join employee e2
on 
e1.manager_id=e2.emp_id


select Order_ID,Order_Date,
DATEPART(YEAR,Order_Date) as 'year of order'
from Orders
where DATEPART(YEAR,Order_Date)=2019;


select Order_ID,Order_Date,
DATEPART(NANOSECOND,Order_Date) as 'naosecond'
from Orders;

select Order_ID,Order_Date,
DATEPART(WEEKDAY,Order_Date) as 'weekday'
from Orders;


select Order_ID,Order_Date,
DATEPART(MONTH,Order_Date) as 'month',
DATEPART(DAY,Order_Date) as'day',
DATEPART(YEAR,Order_Date) as 'year'
from Orders


select Order_ID,Order_Date,
DATENAME(YEAR,Order_Date) as 'year'
from Orders


select  Order_Date,
DATEPART(year,getdate()) as 'year'
from Orders


select Order_Date,
DATENAME(MONTH,Order_Date) as 'month',
DATENAME(YEAR,Order_Date) as 'year',
DATENAME(WEEKDAY,Order_Date) as 'weekday'
from Orders


select Order_ID,Order_Date,
DATEADD(DAY,2,Order_Date) as 'added date'
from Orders

select Order_Date,
DATEADD(WEEK,2,Order_Date) as 'date'
from Orders


select Order_Date,
DATEADD(WEEK,-2,Order_Date) as 'date'
from Orders

select Order_Date,
DATEADD(DAY,-2,Order_Date) as 'date'
from Orders


--DATE DIFFERNCE

select Order_ID,Order_Date,Ship_Date,DATEDIFF(DAY,Order_Date,Ship_Date)as 'day diff'
from Orders

select Profit from Orders

--case when
select Order_ID,Profit,
case
when Profit<100 then 'low profit'
when Profit<200 then 'medium profit'
when Profit<500 then 'Good profit'
else 'paisa he paisa:)'
end as profit_categary
from Orders


select * from employee;
alter table  employee add dob date;
update employee set dob = dateadd(year,-1*emp_age,getdate())

--1- write a query to print emp name , their manager name and diffrence in their age (in days)  
--for employees whose year of birth is before their managers year of birth

select e1.manager_id,e1.emp_name,e2.emp_name as 'manager',e1.emp_age,e2.emp_age as 'manager_age',
abs(DATEDIFF(DAY,e1.emp_age,e2.emp_age)) as 'age_diff'
from employee e1
inner join employee e2
on e1.manager_id=e2.emp_id
order by e1.emp_id


-- 2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)
select o.Sub_Category,o.Order_ID,o.Order_Date,r.return_reason,DATEPART(MONTH,Order_Date) as months,DATEPART(Year,Order_Date) as years
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
where DATEPART(MONTH,Order_Date)=11 and  r.return_reason is NULL


select * from returns_back


--3.write a query to find order ids where there is only 1 product bought by the customer.

select Order_ID,count(Order_ID)
from Orders
group by Order_ID


--4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.

select * from employee

select STRING_AGG(e2.emp_name,' ') as name
from employee e1
inner join employee e2
on e1.manager_id=e2.emp_id
group by e1.manager_id


--5- write a query to get number of business days between order_date and ship_date (exclude weekends). 


select  Order_Date,Ship_Date,DATEDIFF(WEEKDAY,Order_Date,Ship_Date) as 'working days differnece'
from Orders

--6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
select Category,sum(Sales) as total_saless,sum(case when r.return_reason is not null then sales else 0 end ) as 'returned_sales '
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
group by Category

--7- write a query to print  category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)

select Category,Order_Date
sum(case 
when DATEPART(YEAR,Order_Date)=2019 then sales else 0 end)
sum(case when DATEPART(YEAR,Order_Date)=2020 then sales else 0 end )
else 0
end
from Orders
group by Category


--8- write a query print top 5 cities in west region by average no of days between order date and ship date.
select City,avg(DATEDIFF(DAY,Order_Date,Ship_Date)) as 'diff'
from Orders
where Region='West'
group by Region


----6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)

select Category,sum(Sales) as total_sales,
sum(
	case when r.return_reason is not null
	then sales
	else 0
	end) as 'returned_sales'
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
group by Category

----7- write a query to print  category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)


select Category,sum(Sales) as total_sales,
sum(
case when DATEPART(YEAR,Order_Date)=2019 then sales 
else 0
end
) as 'total_Sales in 2019',
sum(
case when DATEPART(YEAR,Order_Date)=2020 then sales
else 0
end
)as 'total sales in 2020'
from Orders
group by Category



select Order_ID,Customer_Name,(len(Customer_Name)) as 'name length',
LEFT(Customer_Name,4) as 'firs  4 characters'
from Orders


select Order_ID,Customer_Name,
RIGHT(Customer_Name,4) as 'last 4 characeters'
from Orders

select Order_ID,Customer_Name,
SUBSTRING(Customer_Name,2,8) as 'substrings',
SUBSTRING(Order_ID,2,5),
CHARINDEX(' ',Customer_Name) as 'space index',
CHARINDEX('n' ,Customer_Name,1) as 'n index',
CHARINDEX('n' ,Customer_Name,4) as 'n index',
CHARINDEX('n',Customer_Name,CHARINDEX('n' ,Customer_Name,1)+1) as n_index,
concat(Order_ID, '-',Customer_ID) as 'concat',
SUBSTRING(Customer_Name,1,CHARINDEX(' ',Customer_Name)) as 'first name',
LEFT(Customer_Name,CHARINDEX(' ',Customer_Name)) as 'first_name',
left(Customer_Name,2) as_first_two,
right(Customer_Name,3) as_last_three,
substring(Customer_Name,4,5) as new_column,
CHARINDEX('g',Customer_Name) as new_col,
REPLACE(Order_ID,'CA','PB'),
TRANSLATE(Customer_Name,'AGD','TPA') as 'translate',--one to one mapping A--->T and G---P
REPLACE(Customer_Name,' ','') as 'removed_sapce',
TRIM(Customer_Name) as 'trimmed'


from Orders

--null handing 

select Order_ID,City,state,ISNULL(City,'Unknown') as 'null coumn',
coalesce(City,state,Region,'No sorry') as 'colasce column'
from Orders
where City is null

select top 5 Order_ID,Sales,cast(Sales as int) as integers,
ROUND(Sales,1) as 'round data'
from Orders


---- set queries -----

-- union, union all ---

create table Order_west(
order_id int,
region varchar(20),
sales int
);

create table Order_east(
order_id int,
region varchar(20),
sales int
);

insert into Order_east(order_id,region,sales)
values(1,'east',100),(2,'east',200);
insert into Order_east(order_id,region,sales)values(4,'west',200);


insert into Order_west(order_id,region,sales)
values(2,'wast',130),(4,'wast',200);

insert into Order_west(order_id,region,sales)values(4,'west',200);


select * from Order_east
union all
select * from Order_west;

select * from Order_east
union 
select * from Order_west;


select distinct * from Order_east
union
select distinct * from Order_west;

select * from Order_east;
select * from Order_west;

--insert into Order_east(order_id,region,sales)values(4,'west',200);

select order_id
from Order_east
union 
select order_id
from Order_west


select * from Order_east
intersect
select * from Order_west;


(select * from Order_east
except 
select * from Order_west)
union all
(select * from Order_west
except 
select * from Order_east);


select *,null from Order_east
union all
select *,null from Order_east


-- intersection is the set operation and join is the join .
-- intersection gives the common rows.
-- it depends on the use cases.