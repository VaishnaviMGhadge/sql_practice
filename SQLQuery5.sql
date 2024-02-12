use namastesql;

drop table shopping;
create table shopping
(
	order_id integer not null unique,
	product_name varchar(20),
	order_date datetime,
	pay_method varchar(20) check(pay_method in ('amazon pay','gpay')),
	categary varchar(20) default 'womens wear',
	primary key(order_id)

);


insert into shopping(order_id,product_name,order_date,pay_method)
values(1,'epsum salt','2024-02-07 07:39','amazon pay'),(2,'epsum salt','2024-02-07 07:39','amazon pay'),
(4,'epsum salt','2024-02-07 07:39','amazon pay');

insert into  shopping(order_id,product_name,order_date,pay_method,categary)
values(5,'maggi','2024-02-07 07:39','amazon pay','vikis wear');

insert into  shopping(order_id,product_name,order_date,pay_method,categary)
values(6,'maggi','2024-02-07 07:39','amazon pay','vikis wear');


select * from shopping;

delete from shopping where order_id=2;

update shopping set product_name='laptop' where order_id=5;

update shopping set order_id=10 where order_id=3;