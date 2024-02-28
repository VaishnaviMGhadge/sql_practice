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
having Sales>avg(Sales);


select Order_ID
from Orders
group by Order_ID
having sum(Sales)>(select avg(A.sum_sales) as avg
from 
(select Order_ID,sum(Sales) as sum_sales
from Orders
group by Order_ID) as A)


select *
from Orders
where Order_ID='CA-2019-158939'


select * 
from employee;

select * from dept;

 update employee
 set dept_id=700
 where dept_id=500;

--find the employees whose dept is not present in the dept table

select e1.emp_id,e1.dept_id,d1.dep_id
from employee e1
left join dept d1
on e1.dept_id=d1.dep_id
where d1.dep_id is null


select *,(select avg(salary) from employee) as avg_salary
from employee
where dept_id not in (select distinct dep_id from dept);

select avg(salary)
from employee


select avg(salary)
from employee
where dept_id!=500


--find the average value of the sales for the orders 

select avg(avg_Sales) as average_sales from 
(select Order_ID,sum(Sales) as avg_Sales
from Orders
group by Order_ID) as A

-- find the orders whose sales is gretor than average sales

select *
from Orders
group by Order_ID
having sum(Sales)>(select avg(avg_Sales)
from 
(select sum(Sales) as avg_Sales
from Orders
group by Order_ID) as A
