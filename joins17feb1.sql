use namastesql
select * from Orders

select * from returns_back


select o.Order_ID,o.Product_Name,r.return_reason,r.Order_ID
from Orders o
inner join returns_back r
on o.Order_ID=r.Order_ID;


select o.*,r.return_reason from 
Orders o
inner join returns_back r
on o.Order_ID=r.Order_ID;



select o.Order_ID,o.Product_Name,r.Order_ID,r.return_reason
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
where r.Order_ID is NULL


---how much sales i lost due to returning order 

select  r.return_reason,sum(o.Sales) as avg_Sales
from Orders o
inner join returns_back r
on o.Order_ID=r.Order_ID
group by r.return_reason

--1- write a query to get region wise count of return orders
select count(r.Order_ID) as returned_orders,o.Region
from Orders o
inner join returns_back r 
on r.Order_ID=r.Order_ID
group by o.Region

--2- write a query to get category wise sales of orders that were not returned

select o.Category,sum(o.Sales) as not_returned
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
where r.Order_ID is not null
group by  o.Category

