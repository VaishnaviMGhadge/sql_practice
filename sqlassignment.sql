use namastesql

select *,ISNULL(City,'no idea') as 'new_city'
from Orders
where City is null
order by City

select * from drivers;

--3- write a query to print below output using drivers table. 
--Profit rides are the no of rides where end location of a ride is same as start location of immediate next ride for a driver


select d1.id,count(1) as _total_rides ,count(d2.id) as profit_rides
from drivers d1
left join drivers d2
on d1.id=d2.id and  d1.end_loc=d2.start_loc and d1.end_time=d2.start_time
group by d1.id


/*

5-write a query to print below output from orders data. example output
hierarchy type,hierarchy name , total_sales_in_west_region, total_sales_in_east_region
category , Technology, ,
category, Furniture, ,
category, Office Supplies, ,
sub_category, Art , ,
sub_category, Furnishings, ,
--and so on all the category ,subcategory and ship_mode hierarchies 
*/

select Category,sum(Sales) as east_sales
from Orders
where region='east'
group by Category;


(select 'category'  as hierarchy_type ,Category as hierarchy_name,
sum(case  when Region='East' then sales end) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Category)

union all

(select 'sub-category'  as hierarchy_type ,Sub_Category as hierarchy_name,
sum(case  when Region='East' then sales end) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Sub_Category)

union all 

select 'ship_mode' as hierarchy_type, Ship_Mode as hierarchy_name,
sum(case when Region='East' then sales end ) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Ship_Mode;


create view orders_vw as 
select * from Orders


select * from orders_vw




select Sub_Category
from Orders
group by Sub_Category

USE [namastesql]
GO

create view order_summery_vw as
(select 'category'  as hierarchy_type ,Category as hierarchy_name,
sum(case  when Region='East' then sales end) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Category)

union all

(select 'sub-category'  as hierarchy_type ,Sub_Category as hierarchy_name,
sum(case  when Region='East' then sales end) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Sub_Category)

union all 

select 'ship_mode' as hierarchy_type, Ship_Mode as hierarchy_name,
sum(case when Region='East' then sales end ) as east_sales,
sum(case when Region='West' then sales end) as west_sales
from Orders
group by Ship_Mode;

select * from order_summery_vw









set statistics time on 
select SYSDATETIME() as startdate;

select top 500 * from Orders
select SYSDATETIME() as enddate;








set statistics time off
select GETDATE()














 
