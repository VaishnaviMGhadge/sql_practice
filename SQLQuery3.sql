Use namastesql;

select top 20 Order_ID,Customer_Name,City from Orders order by City;

select * from Amazon_Orders;


----> alter column order_date to datetime 
alter table Amazon_Orders alter column order_date datetime; 

select * from Amazon_Orders;

insert into Amazon_Orders values(5,'2024-06-10 14:05:02','millets',30,'PAYTM')