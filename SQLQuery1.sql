create table Amazon_Orders
(
	order_id integer,
	order_date date,
	prouct_name varchar(20),
	tota_price integer,
	payment_method varchar(20)
);


insert into Amazon_Orders(order_id,order_date,prouct_name,tota_price,payment_method)
values(1,'2022-02-05','epsum salt',30,'Paytm');

insert into Amazon_Orders(order_id,order_date,prouct_name,tota_price,payment_method)
values(2,'2024-3-05','Dumbells',500,'Amazon Pay');

insert into Amazon_Orders(order_id,order_date,prouct_name,tota_price,payment_method)
values(3,'2022-02-05','yoga mat',30,'Paytm');

insert into Amazon_Orders(order_id,order_date,prouct_name,tota_price,payment_method)
values(4,'2024-3-05','firebolot watch',500,'Amazon Pay');



--select all the columns from the table
select * from Amazon_Orders;

--select perticular column from the table
select prouct_name,order_id from Amazon_Orders;

--> select top 2 records from the table
select top 2* from Amazon_Orders;


---> ordering the data in ascending order
select * from Amazon_Orders order by prouct_name;


---> ordering the data in descending order
select * from Amazon_Orders order by order_date desc,prouct_name asc;


---> drop the table
drop table Amazon_Orders;






--> DDL : Data Defination Language.
--> DML : Data Manipulation Language
--> DCL : Data Control Language. 






/*
	data types:
	 integer ---> all whole numbers 
	 date ----> yyyy-mm-dd
	 decimal(3,2)----> 2 precisions are alllowed...
	 varchar(20) ---> string
*/



/*
creating the table in the database.
selecting the data from the table.
selecting the perticular data from the table.
deleting the table.
*/