create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


select * from icc_world_cup;

--1- write a query to produce below output from icc_world_cup table.
--team_name, no_of_matches_played , no_of_wins , no_of_losses

select count(Team_1)
from icc_world_cup
union all
select count(Team_1)
from icc_world_cup
group by Team_1

--2- write a query to print first name and last name of a customer using orders table(everything after first space can be considered as last name)
--customer_name, first_name,last_name

select Customer_Name,
SUBSTRING(Customer_Name,1,CHARINDEX(' ',Customer_Name)) as 'first name',
SUBSTRING(Customer_Name,CHARINDEX(' ',Customer_Name)+1,CHARINDEX(' ',Customer_Name)) as 'last name'

from Orders

create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');

select * from drivers;
--3- write a query to print below output using drivers table. Profit rides are the no of rides where end location of a ride is same as start location of immediate next ride for a driver
--id, total_rides , profit_rides
--dri_1,5,1
--dri_2,2,0

select d1.id,COUNT(d1.id) as total_rides,count(d2.id)
from drivers d1
left join drivers d2
on d1.id=d1.id and d1.end_loc=d2.start_loc and d1.end_time=d2.start_time
group by d1.id;

--4- write a query to print customer name and no of occurence of character 'n' in the customer name.
--customer_name , count_of_occurence_of_n

select Customer_Name,(len(Customer_Name)-CHARINDEX('n',Customer_Name)) as 'name diff' 
from Orders

select (CHARINDEX('n',Customer_Name))
from Orders

--6- the first 2 characters of order_id represents the country of order placed . write a query to print total no of orders placed in each country
--(an order can have 2 rows in the data when more than 1 item was purchased in the order but it should be considered as 1 order)
select SUBSTRING(Order_ID,1,2) as sub,count(Order_ID)
from Orders
group by SUBSTRING(Order_ID,1,2)

use namastesql
select * from icc_world_cup


select Team_1,
case when Team_1=Winner then  1 else 0 end as win_Flag
from icc_world_cup
union all
select Team_2,
case when Team_2=Winner then 1 else 0 end as win_flag
from icc_world_cup
group by Team_1