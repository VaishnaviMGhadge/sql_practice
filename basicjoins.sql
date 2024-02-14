create table employees(emp_id varchar(10),
emp_name varchar(20),
role varchar(20)
);

create table department(
dept_id varchar(10), dept_name varchar(10),emp_id varchar(10)
);


insert into employees values('e1','vaishnavi','ASE'),
('e2','vivek','SE'),('e3','Indrjeet','CS'),
('e4','mayuri','Manager'),('e5','Seema','Analyst'),
('e6','purva','devops');



insert into department values('d1','Develop','e5'),
('d2','testing','e3'),('d3','commerce','e2'),
('d4','fiance','e6');

select * from employees;

select * from department

select e.emp_id,e.emp_name,e.role,d.dept_name
from employees e
inner join department d
on e.emp_id=d.emp_id;


insert into department values('d1','Develop','e1')