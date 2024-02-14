use namastesql;

select * from Orders;

select top 5 *,Profit/Sales as total 
from Orders
where Category='Furniture' and Profit/Sales>0 
order by total desc 


--> order of execution : from---> where--->order by--->select statements;


select * from Orders
where City is NULL;

--->null is not comparable. it is an unknown value. 



update Orders
set City=NULL
where Order_ID in('CA-2020-152156','US-2021-156909','CA-2020-121755');

select * from Orders
where City is not null;


--AGGREGATION FUNCTION AND THEIR EXAMPLES 

	
select Region, count(*) as cnt,
sum(Sales) as summation,
max(Sales) as maxsale,
avg(Sales) as aveg,
min(Sales) as minimum
from Orders
group by (Region);


select Region,City from Orders
group by Region,City;


select Region,City,sum(Sales)as total_sale  from Orders
where Profit>50
group by Region,City;


select top 5 Region,sum(Sales) as total from Orders
where Profit>50
group by Region
order by total desc;

select Sub_Category,sum(Sales) as total_sales from Orders
group by Sub_Category;

select Sub_Category,sum(Sales) as total_sales 
from Orders

group by Sub_Category
having sum(Sales)>100000
order by total_sales;

--order of execution : from---> where--->group by--->having-->select--->order by


select Sub_Category ,sum(Sales) as total
from Orders
where Profit>50
group by Sub_Category
having(sum(Sales))>100000
order by total
;


select Sub_Category ,sum(Sales) as total_sales
from Orders
group by Sub_Category
having max(Order_Date)>'2020-01-01'
order by total_sales;


select Sub_Category,sum(Sales) as total_sales
from Orders
where (Order_Date)>'2020-01-01'
group by Sub_Category
order by total_sales;
;


--in  select statement  you will only have the those columns which are present in the group by clause  and aggregate function.


--count function

select Category from Orders; 

select count(Distinct(City)) from Orders;


-- any aggregate function will ignore the NULL function
/*
1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909*/

select * from Orders;

update Orders 
set City=Null
where Order_ID in ('CA-2020-161389','US-2021-156909')


--2- write a query to find orders where city is null (2 rows)

select * from Orders 
where City is null;

--3- write a query to get total profit, first order date and latest order date for each category

select Category,sum(Profit) from Orders
where Order_Date='2020-01-01' and Order_Date='2021-01-01'
group by Category

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

select Sub_Category,avg(Profit)
from Orders
group by Sub_Category
having avg(Profit)>1/2*(max(Profit))

--5 create a student table 

create table Student(student_id int not null, subject varchar(20), marks int,primary key(student_id));

insert into Student(student_id,subject,marks) 
values(1,'maths',90),(2,'Algebra',90);

select * from Student

create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);


select * from exams;

--write a query to find students who have got same marks in Physics and Chemistry
select student_id,count(*) as total_records,count(distinct(Marks)) as unique_records from exams
where subject in ('Chemistry','Physics')
group by student_id
having count(*)=2 and count(distinct(Marks))=1;


select student_id,marks,count(1) as total_rows from exams
where subject in ('Chemistry','Physics')
group by student_id,marks
having count(1)=2
order by student_id;


select * from exams 
where subject='Chemistry' or subject='Physics';

--6- write a query to find total number of products in each category.

select Category,count(Product_ID) 
from Orders
group by Category;

--7- write a query to find top 5 sub categories in west region by total quantity sold
select top 5 Sub_Category,sum(Quantity) as total from Orders
where Region='West'
group by Sub_Category
order by total desc;

--8- write a query to find total sales for each region and ship mode combination for orders in year 2020

select Region,Ship_Mode,sum(Sales) as total_Sales
from Orders
where Order_Date between '2020-01-01' and '2020-12-31'
group by Region,Ship_Mode;



--9 find out those students who have same marks in chemistry and physics 

select student_id,marks ,count(1) as countt,count(distinct marks) as distinct_marks   from exams
where subject in ('Chemistry','Physics')
group by student_id,marks
having count(1)=2 and count(distinct marks)=1;

--IMPORTANT --

---------------------------------------------------------------------------
--It will WORK!!!!!! :(

select student_id 
from exams
group by student_id;

----------------------------------------------------------------------------
--This will also work!!! :(
select student_id 
from exams
group by student_id,marks

-----------------------------------------------------------------------------
-- This will not work :(
select student_id,makrs
from exams
group by student_id


