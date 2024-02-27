use namastesql;

create table candidate(id int,skill varchar(20));

insert into candidate
values(123,'python'),(123,'Tableau'),(123,'Postgr'),(234,'R'),(234,'pbi'),(234,'sql'),(345,'python'),(345,'tableau');

select id, count(skill) 
from candidate
where skill in ('python','Tableau','postgr')
group by id
having count(skill)=3