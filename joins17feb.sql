create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);
use namastesql


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;


select * from employee;
select * from dept;



select * 
from employee e
cross join dept d;

select * from 
employee,dept


select * from 
employee e
inner join dept d
on 1=1
order by e.emp_id


select *
from dept d
right join employee e
on d.dep_id=e.dept_id




select *
from dept d
full outer join employee e
on d.dep_id=e.dept_id


create table regional_manager
(
manager varchar(20),
region varchar(20)
);

insert into regional_manager values('ankit','west'),
('deepak','east'),
('vishal','central'),
('sanjay','south');


select * from regional_manager;

select * from Orders;
select * from returns_back;
select * from regional_manager;


select r.return_reason,sum(o.sales) as total
from Orders o 
inner join returns_back r
on o.Order_ID=r.Order_ID 
inner join regional_manager r1
on r1.region=o.Region
group by r.return_reason;



--3- write a query to print dep name and average salary of employees in that dep 
select d.dep_name,avg(e.salary)as avg
from employee e
inner join dept d
on e.dept_id=d.dep_id
group by d.dep_name

--4  write a query to print dep names where none of the emplyees have same salary.

select * from employee;
select * from department


select distinct(e.salary),d.*
from employee e
inner join dept d
on e.dept_id=d.dep_id

--5 write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)

select o.Sub_Category,r.return_reason
from Orders o
inner join returns_back r
on o.Order_ID=r.Order_ID


select o.Sub_Category
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
group by o.Sub_Category
having count(distinct r.return_reason)=3

--6- write a query to find cities where not even a single order was returned.

select o.City,count(r.return_reason)
from Orders o
left join returns_back r
on o.Order_ID=r.Order_ID
group by o.City
having(count(r.return_reason)=0)

--7- write a query to find top 3 subcategories by sales of returned orders in east region
select top 3 r.return_reason
from Orders o 
inner join returns_back r
on o.Order_ID=r.Order_ID
where o.Region='East'
group by r.return_reason


-- 8- write a query to print dep name for which there is no employee
select *
from dept d
left join employee e
on d.dep_id=e.dept_id
where e.emp_id is null

--9- write a query to print employees name for dep id is not avaiable in dept table
select e.emp_name
from employee  e
left join dept d
on  e.dept_id=d.dep_id
where d.dep_name is null










--write a query to print dep names where none of the emplyees have same salary.

select * from employee

insert into employee values(11,'Ramesh',300,8000,6,52)

select salary,count(salary) as same_Salary
from employee 
group by salary
having count(salary)=1


select d.dep_name,count(distinct salary) as count_salary,count(salary) as all_Salary
from employee e
left join dept d
on e.dept_id=d.dep_id
group by d.dep_name
having count(salary)=count(distinct salary)


select * from dept


select e1.emp_id,e1.emp_name,e2.emp_name 
from employee e1
inner join employee e2
on e1.manager_id=e2.emp_id


select * from employee

select e1.emp_name,e2.emp_name,e1.salary,e2.salary
from employee e1
inner join employee e2
on  e1.manager_id=e2.emp_id
where e1.salary>e2.salary
