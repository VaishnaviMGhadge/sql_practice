use namastesql;
select  top 10 * from Orders;


select * from Amazon_Orders;
alter table  Amazon_Orders alter column tota_price decimal(20,1);

insert into Amazon_Orders(order_id,order_date,prouct_name,tota_price,payment_method)
values(6,'2024-02-06 07:10','maggi',34.6,'amazon')


alter table Amazon_Orders add user_name varchar(20);
alter table Amazon_Orders add catgary varchar(20)

alter table Amazon_Orders drop column catgary;

insert into Amazon_Orders values(7,'2024-02-10 5:45','museli',150.67,'gpay','vaishnavi ghadge');
insert into Amazon_Orders values(7,'2024-02-10 5:45',null,150.67,'gpay','vaishnavi ghadge');


alter table Amazon_Orders alter column order_id date;

/*
1. change data type in the exisiting table
2. add new column into the exisiting column
3. delete the column from the exisiting column
*/