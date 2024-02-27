use  namastesql

select Order_ID,Sales
from Orders

select avg(ordered_Sales) from 
(select Order_ID,sum(Sales) as ordered_Sales
from Orders
group by Order_ID) as A


--find the orders  with the sales more than average sales
select avg(sales)  as avg_sales
from 
(select Order_ID,sum(Sales) as sales
from Orders
group by Order_ID) as A
where Sales>avg(Sales);
