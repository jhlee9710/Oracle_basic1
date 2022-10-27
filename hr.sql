-- 아이디,이름,성,부서이름

-- employess, departments


select count(*) from employees;

-- 조인방식
select employee_id,first_name,last_name,department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;

-- 서브쿼리
select employee_id,first_name,last_name,department_id,
    (
        select department_name
        from departments d
        where e.department_id = d.department_id
    ) as dep_names
from employees e
where department_id = 100;

-- 프로시저(함수)
create or replace function get_dep_name(dept_id number)
    return varchar2
is
    sDepName varchar2(30);
begin
    select department_name
    into sDepName
    from departments
    where department_id = dept_id;
    
    return sDepName;
end;
/

variable var_dep_name varchar2(20);

exec :var_dep_name := get_dep_name(90);


set serveroutput on;

select employee_id,first_name,last_name,get_dep_name(department_id)
from employees e
where e.department_id = 90;

-- employees, jobs
-- 사원아이디, 이름, 성, job_title

-- 조인방식
select employee_id,first_name,last_name,job_title
from employees e inner join jobs j
on e.job_id = j.job_id
order by employee_id;

-- 서브쿼리
select employee_id,first_name,last_name,
    (
        select job_title
        from jobs j
        where e.job_id = j.job_id
    ) as job_title
from employees e
order by employee_id;

-- get_job_title()
create or replace function get_job_title(asdf varchar2) -- 매개변수 뒤에 exec문장에서 넣을 (' ')
    return varchar2 
is
    sDepName varchar2(30); 
begin
    select job_title        -- jobs 테이블에서 asdf 매개변수에 들어간 값과 같은 job_id행에 job_title을 sDepName변수에 넣는다.
    into sDepName       
    from jobs      
    where asdf = job_id;       
    
    return sDepName;        
end;
/

variable var_job_title varchar2(20);    

exec :var_job_title := get_job_title('AD_PRES'); -- asdf

select employee_id,first_name,last_name,get_job_title(job_id)
from employees;



