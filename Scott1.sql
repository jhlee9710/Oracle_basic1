-- ������ ����
-- select �÷Ÿ�
-- from ���̺��
-- order by �÷���(���ı����� �Ǵ� ��) asc/desc

--select *
--from emp
--order by sal asc(��������)/desc(��������)

select* from emp
order by sal asc;

select* from emp
order by sal desc;

-- ���� (1~10), ��¥(���ų�¥ ~ �ֱٳ�¥), ����(��������)

select * from emp
order by hiredate;

-- ���ǰ˻�
-- select �÷���
-- from ���̺��
-- where ���ǽ�; <, >, =, != / <>, <=, >=, and, or

select * from emp
where sal >= 3000;

-- and �ΰ��� �̻��� ������ ��� ���ΰ��
select * 
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;ob

-- ��¥�� �������� ����Ҷ�
-- '  '
-- ��¥�� ũ�Ⱑ �ִ�
-- 80/12/20 -> 1980 12 20 �ð� �� �� ����

select * from emp
where hiredate < '1982/01/01';

--OR �ΰ� �̻��� �����߿� �ϳ� �̻� ���� ���
SELECT *
FROM emp
WHERE deptno = 10 or sal >= 2000;

--NOT ������ ������

SELECT *
FROM emp
WHERE sal != 3000;

SELECT *
FROM emp
WHERE not sal = 3000;

--AND, OR
--���� ������ ǥ�� �� �� ���

SELECT *
FROM emp
WHERE sal >= 1000 and sal <= 3000;

SELECT *
FROM emp
WHERE sal <= 1000 OR sal >= 3000;

--BETWEEN AND
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;
--========================
select * from emp
where sal = 800 or sal = 3000 or sal = 5000;

select * from emp 
where sal in(800,3000,5000);
--========================

-- like ������
-- ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
-- ���̵� ī�带 ����Ѵ� ( % , _)
-- %�� ��� ���ڸ� ��ü�Ѵ�.
-- _�� �� ���ڸ� ��ü�Ѵ�.

select * from emp 
where ename like 'F%';

select * from emp
where ename like '%D';

select * from emp 
where ename like '%O%';

select * from emp 
where ename like '___D';

select * from emp 
where ename like 'S___%';

-- null ������
-- is null/ is not null

select * from emp 
where comm is null;

-- ���� ������
-- �ΰ��� select ������ ����Ѵ�.
-- �÷��� ������ �����ؾ��Ѵ�.
-- �÷��� Ÿ���� �����ؾ��Ѵ�.
-- �÷��� �̸��� �������.
-- ������, ������, ������

select empno, ename, sal, deptno
from emp
where deptno = 10
union all-- ������ union(�ߺ�����) union all(�ߺ� ������)
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
minus -- ������ 
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename ,sal, deptno
from emp
intersect -- ������
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- ������
-- where 
-- �񱳿�����, ��������, like, is null / is not null, ���տ�����
-- �񱳿�����: <, >, <=, >=, =, !=
-- ��������: and, or, not, between and, in
-- like: %: ���ڼ� ������� ���ڴ�� ���� _: ���ڼ��� ����ϸ� ���ڴ�� ����
-- null������: is null, is not null
-- ���տ�����: union(������ �ߺ�����), union all(������ �ߺ�������), minus(������), intersect(������)


select * from emp
where ename like '%S';

select empno, ename, job, sal, deptno
from emp
where deptno = 30 and job = 'SALESMAN';
--===================
select empno, ename, job, sal, deptno
from emp
where deptno in(20,30) and sal>2000;

select empno, ename, job, sal, deptno
from emp
where deptno in(20,30)
intersect
select empno, ename, job, sal, deptno
from emp
where sal> 2000;
--=================
select *
from emp
where sal < 2000 or sal > 3000;

select ename,empno,sal,deptno
from emp
where ename like '%E%' and deptno = 30 and sal not between 1000 and 2000;

select * from emp
where comm is null and ename not like '_L%'
and job = 'MANAGER' or job = 'CLERK';

--�Լ�
--�����Լ�: upper, lower, substr, instr, replace, lpad, rpad, concat
--�����Լ�
--��¥�Լ�

SELECT 'Welcome', UPPER('Welcome')
FROM dual;

SELECT LOWER(ename), UPPER(ename)
FROM emp;

SELECT *
FROM emp
WHERE ename = 'FORD';

SELECT *
FROM emp
WHERE LOWER(ename) = 'scott';

SELECT ename,LENGTH(ename)
FROM emp;

SELECT 'Welcome to Oracle', substr('Welcome to Oracle', 2, 3), substr('Welcome to Oracle', 10)
FROM dual;

SELECT 'Welcome to Oracle', substr('Welcome to Oracle', -3, 3), substr('Welcome to Oracle', -17)
FROM dual;

SELECT INSTR('Welcome to Oracle', 'o')
FROM dual;

SELECT INSTR('Welcome to Oracle', 'o', 6)
FROM dual;

SELECT INSTR('Welcome to Oracle', 'e', 3, 2)
FROM dual;

SELECT 'Welcome to Oracle',replace('Welcome to Oracle', 'to', 'of')
FROM dual;

SELECT 'oracle',LPAD('oracle', 10, '#'),RPAD('oracle',10,'*'),LPAD('oracle',10)
FROM dual;

SELECT RPAD('001103-',14,'*')
FROM dual;

SELECT concat(empno, ename), empno || '' || ename
FROM emp;

---����---

SELECT
    ROUND(1234.5678),
    ROUND(1234.5678,0),
    ROUND(1234.5678,1),
    ROUND(1234.5678,2),
    ROUND(1234.5678,-1)
FROM dual;

SELECT
    TRUNC(1234.5678),
    TRUNC(1234.5678,0),
    TRUNC(1234.5678,1),
    TRUNC(1234.5678,2)
FROM dual;  

SELECT
CEIL(3.14),     --�ڽź��� ū ���� ����� ���� 4
FLOOR(3.14),    --�ڽź��� ���� ���� ����� ���� 3
CEIL(-3.14),    -- -3
FLOOR(-3.14)    -- -4
FROM dual;

SELECT MOD(5,2), MOD(10,4)
FROM dual;

SELECT *
FROM emp
WHERE MOD(empno, 2) = 1;

--��¥ �����͸� �ٷ�� ��¥ �Լ�
--����
select sysdate
from dual;

--����
select sysdate -1
from dual;

--����
select sysdate +1
from dual;

--���̰� �ϼ� ��ȯ
select sysdate - hiredate as �ٹ��ϼ�
from emp;

--�ټӳ��
select trunc((sysdate-hiredate)/365) as �ٹ��ϼ�
from emp;
--���� ��
--CC: �� �ڸ� ������ �� �� �ڸ��� �������� ���(2022���� 2050�� �����̹Ƿ� �ݿø� �� ��� 2001������ ó��).
--YYYY: ��¥ �������� �ش� ��, ��, ���� 7�� 1���� ����(2022�� 10�� 19�� �� ���, 2023������ ó��).
--Q: �� �б��� �� ��° ���� 16�� ����(���� 11�� 15���� ���� �ʾ����Ƿ� 22�� 10�� 1��).
--DDD: �ش� ���� ����(12:00:00)�� ����(������ ���� �ʾ����Ƿ� 22�� 10�� 19��).
--HH: �ش����� �ð��� ����(22�� 10�� 19�� 10:49 �̹Ƿ� �ݿø��ص� 22�� 10�� 19��).
select sysdate,
    round(sysdate, 'CC') as format_CC,
    round(sysdate, 'YYYY') as format_YYYY,
    round(sysdate, 'Q') as format_Q,
    round(sysdate, 'DDD') as format_DDD,
    round(sysdate, 'HH') as format_HH  
from dual;

select sysdate,
    trunc(sysdate, 'CC') as format_CC,
    trunc(sysdate, 'YYYY') as format_YYYY,
    trunc(sysdate, 'Q') as format_Q,
    trunc(sysdate, 'DDD') as format_DDD,
    trunc(sysdate, 'HH') as format_HH  
from dual;

--�ڷ�����ȯ �Լ�
--to_char()
--to_number()
--to_date()

--��¥�� ����
select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') as �Ի�����
from emp;

--���ڸ� ����
select to_char(123456, '999,999')
from dual;

select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L999,999')
from emp;

--���ڸ� ���ڷ�
select '20000' - 10000
from dual;

select 20000 - '10000'
from dual;

select '20000' - '5000'
from dual;

--to_number() ����ȯ�� �ؾ��Ѵ�.
select '20,000' - '5,000'
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥��
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');


-- null ������ ó��
-- nvl(null,�ٲٰ� ���� ������)
-- nvl�� null �������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
-- nvl(����,����), nvl(����,����)

-- select ename �����,sal,sal*12 + nvl(comm,0) as ����,comm
-- from emp;

select *
from emp;

select *
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr),'CEO') as MGR
from emp
where mgr is null;

-- ���ǹ� ǥ���ϴ� �Լ�
-- decode() -> switch
-- case     -> if

select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ')
from emp;

-- case ������ �������� ������ �� �ִ�.
--    when ���ǽ�   then ���๮
--    when ���ǽ�   then ���๮
--    when ���ǽ�   then ���๮
--    when ���ǽ�   then ���๮
--    else
-- end as ��Ī

select ename,job,deptno,
    case
        when deptno = 10 then 'AAA'
        when deptno = 20 then 'BBB'
        when deptno = 30 then 'CCC'
        else '��Ÿ'
        end as �μ���
from emp;

select ename,job,sal,
    case 
    when sal between 3000 and 5000 then '�ӿ�'
    when sal >= 2000 and sal < 3000 then '������'
    when sal >= 500 and sal < 2000 then '���'
    else '��Ÿ'
    end as ����
from emp;
--============================================== 174p
select empno,replace(empno,substr(empno,-2),'**')as MASKING_EMPNO,ename,replace(ename,substr(ename,-4),'****') as MASKING_ENAME
from emp
where length(ename)=5;

select empno,rpad(substr(empno,1,2),4,'*'),
ename,rpad(substr(ename,1,1),length(ename),'*')
from emp
where length(ename) >=5 and
length(ename)<6;

5
select empno,ename,sal,trunc(sal/21.5,2) as DAY_PAY,round(sal/21.5/8,1) as TIME_PAY
from emp;


select empno,ename,mgr,
    case
        when mgr between 7500 and 7599 then 5555
        when mgr between 7600 and 7699 then 6666
        when mgr between 7700 and 7799 then 7777
        when mgr between 7800 and 7899 then 8888
        when mgr is null then 0000
        else mgr
        end as CHG_MGR
from emp;

select empno,ename,mgr,
    case
        when substr(mgr,1,2) = '75' then '5555'
        when substr(mgr,1,2) = '76' then '6666'
        when substr(mgr,1,2) = '77' then '7777'
        when substr(mgr,1,2) = '78' then '8888'
        when mgr is null then '0000'
        else to_char(mgr)
        end as CHG_MGR
from emp;
                
select sum(sal)
from emp;

select avg(sal)
from emp;

select count(*),count(comm)
from emp;

select max(sal),min(sal)
from emp;

select *
from emp;

select min(hiredate),max(hiredate)
from emp;

--========================================
-- select �÷���
-- from ���̺��
-- where ���ǽ�(�׷��Լ� ���Ұ�/group by, having ���� ��������)
-- group by �����÷���
-- having ���ǽ�
-- order by �÷��� ���Ĺ�� ==> �� �������� �ۼ�

select avg(sal) 
from emp 
where deptno = 10
union
select avg(sal) 
from emp 
where deptno = 20
union
select avg(sal) 
from emp 
where deptno = 30;

select avg(sal),deptno
from emp
group by deptno;

select round(avg(sal)),job,deptno
from emp
group by job,deptno
order by deptno desc,job desc ;

select avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; -- group by�� ���ؼ� ��ȸ ����� ������ �ش�. ���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�.

select avg(sal)
from emp
where deptno !=10
group by deptno;

select deptno, job, sal
from emp
where sal<=3000
order by deptno,job;

-- ����(join)
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ��̻��� ���̺��� �ۼ��Ѵ�.
-- where�� ���� ������ �ۼ��Ѵ�
-- cross join (where�� ���� ����)
-- equi join  (where ������� : =)
-- non equi join  (where ���������� : and, or)
-- self join (where �ϳ��� ���̺��� ����Ѵ�)
-- out join (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ����� : (+)) // [left. right, full] outer join

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d -- ���̺� ��Ī�ο�
where e.deptno = d.deptno
and sal >= 3000;

select *
from dept;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
-- where e.sal >= s.losal and e.sal <= s.hisal;

select *
from emp;

select *
from dept;

select *
from emp,dept,salgrade;

select empno,ename,e.sal,d.deptno,d.dname,s.grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e,emp m    -- �ݵ�� ��Ī�ο�
where e.mgr = m.empno(+);

select *
from emp;

select ename,deptno
from emp
where deptno = 20;

select e.ename,a.ename
from emp e,emp a
where e.deptno = a.deptno and e.ename = 'SCOTT'
and a.ename != 'SCOTT';

select *
from emp
where ename ='SCOTT';

-- �ܺ�����
-- ��� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ����Ѵ�.

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(ǥ������ ���)
select ename,sal,dname,loc
from emp inner join dept
on emp.deptno = dept.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- ���� ���̺��� �÷����� �����Ҷ� ����
where e.ename = 'SCOTT';

--====================================

select e.empno,e.ename,e.mgr,m.ename as MGR_NAME
from emp e inner join emp m
on e.mgr = m.empno(+);

select e.empno,e.ename,e.mgr,m.ename as MGR_NAME
from emp e left outer join emp m
on e.mgr = m.empno;

--====================================

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d 
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

--======================================
select *
from emp,salgrade;
--===========================================
select e.deptno,d.dname,empno,ename,sal
from emp e inner join dept d
on e.sal>2000 and e.deptno = d.deptno
order by e.deptno,ename;

select deptno,d.dname,empno,ename,sal
from emp e inner join dept d
using (deptno) -- using�� �ĺ��ڸ� ���� ���� ���� (select,order ������ e.deptno -> deptno)
where e.sal>2000
order by deptno,ename;


select d.deptno,d.dname,trunc(avg(sal)) as AVG_SAL,max(sal) as MAX_SAL,min(sal) as MIN_SAL,count(*) as CNT
from emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno,dname;


select d.deptno,d.dname,empno,ename,job,sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno,ename;


select d.deptno,d.dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,s.losal,s.hisal,s.grade,f.empno as MGR_EMPNO,f.ename as MGR_ENAME
from emp e left outer join emp f
on e.mgr = f.empno
right outer join dept d
on e.deptno = d.deptno
left outer join salgrade s
on e.sal between s.losal and s.hisal
order by d.deptno,e.empno;

--===================================

select deptno
from emp
where ename = 'SCOTT';

select dname
from dept
where deptno = 20;

select dname
from dept
where deptno = (
                select deptno
                from emp
                where ename = 'SCOTT'
                );

select ename,sal
from emp
where sal = ( 
                select max(sal)
                from emp
            );
select *
from dept;

-- DALLAS ���� �ٹ��ϴ� ������� �̸��� �μ� ��ȣ���ϱ�
select ename,deptno
from emp
where deptno = (
                    select deptno
                    from dept
                    where loc = 'DALLAS'
                );
                
-- �ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ�ϼ���(��������)

select ename,sal
from emp
where mgr = (
                select empno
                from emp
                where ename ='KING'
                );
                
select *
from emp

--=================================================

select *
from emp
sjere sal in (5000,3000,2850);

select *
from emp
where sal >any( 
                select max(sal)
                from emp
                group by deptno);
                
select *
from emp
where sal > all( 
                select sal
                from emp
                where deptno = 30);
                
select *
from emp
where (deptno,sal) in (
                        select deptno,max(sal)
                        from emp
                        group by deptno
                        );
    
--=================================================

--DML(���������۾�): insert, update, delete
--insert: ���̺� ������ ����
--insert into ���̺�� (�÷���1, �÷���2,...)
--values (��1, ��2, ...)
--�÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.
--�ۼ� ������� 1:1 ��Ī�ȴ�.

--���̺� �����ϱ�
create table dept_temp
as
select * from dept;

select *
from dept_temp;

--���̺� ������ ����
insert into dept_temp (deptno, dname, loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --�÷� ����, ��� �÷��� �����͸� �ְڴٴ� �ǹ�
values (70,'HTML','SEOUL');

insert into dept_temp (deptno, dname)  --������ NULL ������ ����
values(60,'JSP');

insert into dept_temp   --�÷�����, ����� NULL ������ ����
values (80, NULL, 'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;


select *
from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

--update: �÷��� �����͸� ����(����)
--update ���̺��
--set �÷��� = ��, �÷��� = �� ...
--where ���ǽ�
--���ǽ��� ������� ������ �ش� �÷��� ��� ����ȴ�.

drop table dept_temp2;  -- ���̺� ����

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;


--delete(������ ����)
--delete from ���̺��
--where ���ǽ�
--�������� ������� ������ ��� �����Ͱ� �����ȴ�.

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';


--TCL(�������� �������� �Ǵ� ���)
--Ʈ������
--commit, rollback, savepoint
--commit: ������ ��������(���̺��� ������ �ݿ�)
--        commit������ ����ؼ� ��ü�����Ҷ�(�ڵ�)
--rollback: ������ ���� ���(���̺��� ������ �̹ݿ�), ���󺹱�
--          õ������, ����, ����(�ڵ�)
--savepoint: 

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

drop table dept01;

rollback;

commit;

truncate table dept01;

-- DDL(������ ���Ǿ�) : table(��簴ü)�� ����, ����, �����ϴ� ��ɾ�
-- create(����), alter(����). drop(����)

create table emp_ddl(
        --���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
        empno number(4),
        ename varchar2(10), -- byte -- ���ĺ��� �ѱ��ڿ� 1byte �ѱ��� �ѱ��ڿ� 2byte
        job varchar2(10),
        mgr number(4),
        hiredate date,
        sal number(7,2),
        deptno number(2)
        );
        
select *
from emp_ddl;

insert into emp_ddl
value (;

create table dept_ddl -- ���̺��� ����
as
select * from dept;
        
create table dept_30
as
select * from dept
where deptno = 30;

select * from dept_ddl;
select * from dept_30;

create table dept_m
as
select dname,loc
from dept;

select * from dept_m;

create table emp_e
as
select * from emp
where 1 !=1;

select * from emp_e;
select * from dept_d;
--============================
-- ���̺� ����(�÷��� ���� ����)
-- ���ο� �÷� �߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
-- alter

create table emp_alter
as
select * from emp;

select * from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

drop table emp_alter;

--==================================== 324p ����Ǯ��

create table emp_hw ( 
            empno number(4),
             ename varchar2(10),
            job varchar2(9),
             mgr number(4),
             hiredate date,
          sal number(7,2),
          comm number(7,2),
           deptno number(2)
        );

alter table emp_hw
add bigo varchar(20);

alter table emp_hw
modify bigo varchar2(30);

alter table emp_hw
rename column bigo to remark;

insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,NULL
from emp;

drop table emp_hw;

select * from emp_hw;

--========================================
-- ������ ����
desc user_tables;


select table_name
from user_tables;

--======================================
-- index (�˻��ӵ��� ����ϱ� ���� ��� ��ü)
-- select ������ �˼��� ��� ��Ų��.
-- ��ü ���ڵ��� 3%~5% �����϶�
-- index ��ü�� �÷��� �����ؼ� ����Ѵ�.

create index �ε�����
on ���̺�� (�÷���);

create table emp03
as
select* from emp;

insert into emp03
select * from emp03;

insert into emp03(empno,ename)
values (1111,'bts');

select *
from emp03
where ename = 'bts';

create index idx_emp03_ename
on emp03(ename);

drop index idx_emp03_ename;

select * from emp03;

-- ���̺� ���� �� ����

show recyclebin;  -- ������ ��� ����
flashback table emp_temp    -- �����뿡 �ִ� ���̺� ����
to before drop;

purge recyclebin; -- ������ ����

-- �������� (���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ°�
-- not null : �ش� �÷��� null���� ���� �� ����.
-- unique : 
-- primary key (�⺻Ű)
-- foreign key (�ܷ�Ű/����Ű)
--  1. �θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺� �÷��� �����Ѵ�.
--  2. �θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique�ؾ��Ѵ�.
-- check

-- emp,dept
insert into emp
values (1111,'aaa','MANAGER',9999,SYSDATE,1000,NULL,50);

select * from emp01;

create table emp02(
        empno number (4) constraint emp04_empno_pk primary key,    -- not null + unique
        ename varchar2(10) constraint emp04_ename_nn not null,
        job varchar2(9),
        deptno number(2)
        );
drop table emp02;

delete from emp02;
        
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (2222,'ȫ�浿',null,30);

insert into emp02
values (null,'������','SALESMAN',30);

select * from emp02;

--======================================

create table emp07(
    empno number(4) constraint emp07_empno_pk primary key,
    ename varchar2(9) constraint emp07_ename_nn not null,
    job varchar2(9),
    deptno number(2) constraint emp07_deptno_fk references dept07(deptno)   --references (����Ű)
    );
    
create table dept07(
    deptno number(2) constraint dept07_deptno_pk primary key,
    dname varchar2(20) constraint dept07_dname_nn not null,
    loc varchar2(20) constraint dept07_loc_nn not null
    );

insert into emp07
select empno,ename,job,deptno
from emp;

insert into dept07
select * from dept;

insert into emp07
values (1111,'aaa','MANAGER',50);

create table emp08(
    empno number(4) constraint emp08_empno_pk primary key,
    ename varchar2(10) constraint emp08_ename_nn not null,
    sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000), 
    gender varchar2(2) constraint emp08_gender_ck check(gender in ('M','F'))
    );
    
insert into emp08
values (1111,'hong',1000,'M');

insert into emp08
values (2222,'hong',200,'M');

select *
from emp08;

create table dept08(
    deptno number(2) primary key,
    dname varchar2(10) not null,
    loc varchar2(15) default 'SEOUL'
);

insert into dept08(deptno,dname)
values (10,'SALES');

select * from dept08;

insert into dept08(deptno,dname,loc)
values (20,'SALES','BUSAN');

-- �������� �������
-- �÷� ������ ����(not null�� �÷� ���������� ����)
-- ���̺� ������ ����(not null�� ������ �� ����.)

create table emp09(
    empno number(4),
    ename varchar2(20) constraint emp09_ename_nn not null,
    job varchar2(20),
    deptno number(20),
    
    constraint emp09_empno_pk primary key(empno),
    constraint emp09_ename_uk unique(job),
    constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
    );
    
insert into emp09
values (3333,'hong','PRESIDENT',80);

--����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
--���̺� ���� �������θ� ���� ����
    --1. ���̺� �ȿ��� �����ϴ� ���
    --2. Alter ��ɾ� �����

create table member(
    name varchar2(10),
    address varchar2(30),
    hphone varchar2(10),
    
    constraint member_name_address_pk primary key(name,address)
    );
    
create table emp10(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(10)
    );
    
alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_empno_fk foreign key(deptno) references dept(deptno);

-- not null�� ������ ����(null -> not null)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;   

create table emp11(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(10)
    );
    
alter table emp11
add constraint emp11_empno_pk primary key(empno);

alter table emp11
add constraint emp11_empno_fk foreign key(deptno) references dept11(deptno);


create table dept11(
    deptno number(2),
    dname varchar2(10),
    loc varchar2(15)
);

alter table dept11
add constraint dept11_deptno_pk primary key(deptno);

insert into dept11
select * from dept;

insert into emp11
select empno,ename,job,deptno
from emp;

delete from dept11
where deptno = 10;

alter table dept11;
disable primary key cascade;

alter table dept11; --�������� ����
drop primary key cascade; 

create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar(13)
);

alter table dept_const
    add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
    add constraint deptconst_dname_unq unique(dname);
    
alter table dept_const
    modify loc constraint deptconst_loc_nn not null;
    
create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7, 2),
    comm number(7, 2),
    deptno number(2)
);

alter table emp_const
    add constraint empconst_empno_pk primary key(empno);
    
alter table emp_const
    modify ename constraint empconst_ename_nn not null;
    
alter table emp_const
    add constraint empconst_tel_unq unique(tel);
    
alter table emp_const
    add constraint empconst_sal_chk check(sal between 1000 and 10000);
    
alter table emp_const
    add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);
    
--��ü: table, index, view
--create or replace view �����̺��([alias])
--as
--��������(select)
--[with check option]
--[with read only]

create table dept_copy
as
select * from dept;

create table emp_copy   --����Ǵ� ���̺��� ���������� �Ѿ���� �ʴ´�.
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy; --14

create or replace view emp_view30
as
select empno, ename, sal, deptno from emp_copy
where deptno = 30;

grant create view -- view ���̺��� ������ �� �ִ� ���Ѻο�, system���� �۵�
to scott;

select * from emp_view30;
select * from emp_copy;

insert into emp_view30
values (1111, 'hong', 1000, 30);

insert into emp_view30 (empno, ename, sal)
values (2222, 'hong', 2000);

insert into emp_view30 (empno, ename, sal,deptno)
values (2222, 'hong', 2000, 50);

insert into emp_view30 (empno, ename, sal,deptno)
values (2222, 'hong', 2000, 30);

create or replace view emp_view(�����ȣ, �����, �޿�, �μ���ȣ)
as
select empno, ename, sal, deptno
from emp_copy;

select * from emp_view;

select *
from emp_view
where �μ���ȣ = 20;
--where deptno = 20; ��Ī�� �ο��ϸ� ���� �÷��� ��� �Ұ���


--���պ�
create or replace view emp_dept_view
as
select empno, ename, sal, e.deptno, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select *
from emp_dept_view;

--�μ��� �ּұ޿��� �ִ�޿�
--dname min_sal max_sal

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal, round(avg(sal),-1) as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select *
from sal_view;

drop view sal_view;

create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; --�������� �÷��� �������� ���ϰ� �Ѵ�.

update view_chk30
set deptno = 10;

select * from view_chk30;

select * from emp_copy;

create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno =30 with read only; -- ��� �÷��� ���� C U D �� �Ұ����ϴ�.

update view_read30
set deptno = 10;
-- �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.(insert, update, delete)

-- ���� Ȱ��
-- TOP - N ��ȸ�ϱ�
select * from emp;

--�Ի����� ���� ���� 5���� ����� ��ȸ

create or replace view view_hire5
as
select *
from emp_copy
where hiredate <= '81/05/01';

desc emp;

select rownum empno,ename,hiredate
from emp
where rownum <= 5;

select * from view_hire5;

select rownum empno,ename,hiredate
from emp
order by hiredate asc;

create or replace view view_hiredate
as
select *
from emp
order by hiredate asc;

select empno,ename,hiredate
from view_hiredate
where rownum <=5; -- rownum�� �������� ���� �ݵ�� 1�� �����ϴ� ���ǽ��� �������Ѵ�


select rownum empno,ename,hiredate
from view_hiredate;

create or replace view view_hdrm
as
select rownum rm,empno,ename,hiredate
from view_hiredate;

select empno,ename,hiredate
from view_hdrm
where rm between 2 and 5; 

select * from view_hdrm;

-- �ζ��κ�

select empno,ename,hiredate
from (
        select rownum rm,empno,ename,hiredate
        from(select empno,ename,hiredate
             from emp
             order by hiredate asc
            )a
    )b
where rm between 2 and 5;

--�Ի����� ���� ���� 5���� ��ȸ�ϱ�

select empno,ename,hiredate
from (
        select *
        from emp
        order by hiredate
        )
where rownum <=5;

-- ������ ��ü
-- �ڵ����� ��ȣ�� ������Ű�� ��ɼ���
-- create ,drop
-- nextval, currval

-- create seqience ��������
-- start with ���۰� => 1
-- increment by ����ġ => 1 
-- maxvalue �ִ밪 => 10�� 1027��
-- minvalue �ִ밪 => 10�� -1027��

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

create sequence emp_seq
increment by 1
start with 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate
from emp
where 1 !=1;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);

select * from emp01;


create table product(
    pid varchar2(10),
    pname varchar2(10),
    price number(5),
    
    constraint product_pid_pk primary key(pid)
    );
    
create sequence odx_product_id
start with 1000;

insert into product(pid,pname,price)
values ('pid' || odx_product_id.nextval,'ġ��',2000);

select * from product;

drop table product;

-- ����� ����(��ü)
-- ������ �������� ����(system)
-- create, drop
-- create user ������ identified by �н����� // ��������
-- alter user ������ identified by �н�����  // ���� ��й�ȣ ���� 
-- drop user ������ cascade                 // ��������

-- DCL(�����)
-- grant(���Ѻο�), revoke(����ȸ��)
-- grant �ý��۱��� to ������ 
-- revoke �ý��۱��� from ������

-- �ý��� ����(create, ...)
-- ��ü ����(select, ...)

grant select -- name01�� emp���̺��� select�Ҽ��ִ� ���Ѻο�
on emp
to name01;

revoke select
on emp
from name01;

-- ����� ���� ��
-- ������ ���������� ����
-- create role �Ѹ�
-- grant ���� to �Ѹ�
-- �����ڱ��ѿ��� �� ����
-- ��ü������ �ش� ����� �������� ����

grant select 
on emp
to mrole2;

grant select
on emp
to mrole;

revoke select
on emp
from mrole2;

select * from emp;

--===============================================
-- PL/SQL (Ȯ��Ǿ��� SQL���)
-- ����, ���ǹ�, �ݺ���

-- set serveroutput on; ó�� ���� �ۼ��Ǿ�� �� ��
-- declare
--      ���� ����
-- begin    // �ʼ�
--      SQL���� �ۼ�
--      ��±��� �ۼ� // �������� �������� �ݵ�� ����Լ��� ���ؼ� Ȯ���ؾ��Ѵ�.
-- exception (����ó�� ��밡��)
--      ����ó�� ����
-- end;     // �ʼ�
-- /

set serveroutput on;
begin
    dbms_output.put_line('Hello World');
end;
/

declare
--    vempno number(4); -- ������ ����
--    vename varchar2(10);
    
    vempno number(4) := 7777; -- ����� ����
    vename varchar2(10) not null := 'SCOTT'; -- null���� ������ ������ ����� �� ����.
begin
--  vempno := 7777;
--  vename := 'SCOTT';
  
  dbms_output.put_line(' ��� / �̸�');
  dbms_output.put_line(vempno || ' '|| vename);
end;
/


declare
    -- ��ų�� ���
--    vempno number(4);
    -- ���۷��� ���
    vempno emp.empno%type; -- ���� ���̺� �ִ� �÷��� Ÿ���� �����Ѵ�
begin
    vempno := 7777;
    dbms_output.put_line(vempno);
end;
/


declare
    -- ���۷��� ���
     vempno emp.empno%type;
     vename emp.ename%type;
begin
    select empno,ename into vempno, vename
    from emp;
--    where empno = 7788; -- �ʼ�
    
    dbms_output.put_line('��� / �̸�');
    DBMS_OUTPUT.PUT_LINE(vempno);
exception -- (����ó����)
    when TOO_MANY_ROWS then dbms_output.put_line('���� ���� �ʹ� �����ϴ�'); 
    when OTHERS then dbms_output.put_line('��� ���ܿ� ���� ó��');
end;
/

declare
    -- ���̺� type(����� ���� ���� Ÿ��)
    -- �迭�� ����
    -- vename varchar(10);
    type ename_table_type is table of emp.ename%type
    index by binary_integer;
    
    type job_table_type is table of emp.job%type
    index by binary_integer;
    
    type empno_table_type is table of emp.empno%type
    index by binary_integer;
    
    type mgr_table_type is table of emp.mgr%type
    index by binary_integer;
    
    type sal_table_type is table of emp.sal%type
    index by binary_integer;
    
    
    enameArr ename_table_type; -- �迭������ ���� ����
    jobArr job_table_type;     -- �迭������ ���� ����
    empnoArr empno_table_type;
    mgrArr mgr_table_type;
    salArr sal_table_type;
    
    i binary_integer := 0;
begin
    for k in (select ename,job,empno,mgr,sal from emp) loop
        i := i + 1;
        enameArr(i) := k.ename;
        jobArr(i) := k.job;
        empnoArr(i) := k.empno;
        mgrArr(i) := k.mgr;
        salArr(i) := k.sal;
    end loop;
    
    for j in 1..i loop
        dbms_output.put_line(empnoArr(j) || ' / ' || enameArr(j) ||  ' / ' || jobArr(j) || ' / ' || mgrArr(j) || ' / ' || salArr(j));
    end loop;
end;
/


declare
    -- ���ڵ� type(�������� ������ ��� ����Ѵ�) => ����� ���� ���� Ÿ��
    -- (�ڹ�)Ŭ������ �����ϴ�.
    type emp_record_type is record(
        v_empno emp.empno%type,
        v_ename emp.ename%type,
        v_job emp.job%type,
        v_deptno emp.deptno%type
    );
    
    emp_record emp_record_type; -- ���ڵ� Ÿ���� ���� ����,
    
begin
    select empno,ename,job,deptno
    into emp_record
    from emp
    where empno = 7788;
    
    dbms_output.put_line(emp_record.v_empno || ' / ' || emp_record.v_ename ||  ' / ' || emp_record.v_job || ' / ' || emp_record.v_deptno);
end;
/

--������ ���̺� ����
create table dept_record
as
select * from dept;

drop table dept_record;

--PL/SQL �÷� ������ ���� / insert
declare
    TYPE rec_dept IS RECORD(
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
   
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'DEV';
    dept_rec.v_loc := 'BUSAN';
   
    --���� �÷��� ������� ���� �����Ϳ� �����ϰ� ���� ���߾� ��ȣ�ȿ� ���־�� �ϳ� ���� ����, ���ڵ�� ������ ������ ������ �����ϴ�.
    insert into dept_record --(v_deptno, v_dname, v_loc)
    values dept_rec; --(50, 'DEV', 'BUSAN')
end;
/

select * from dept_record;

--PL/SQL �÷� ������ ���� / update
declare
    TYPE rec_dept IS RECORD(
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
   
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'SOP';
    dept_rec.v_loc := 'SEOUL';
   
    update dept_record
    set dname = dept_rec.v_dname, loc = dept_rec.v_loc
    where deptno = dept_rec.v_deptno;
end;
/

--PL/SQL �÷� ������ ���� / delete
declare
    v_deptno dept_record.deptno%type := 50;
begin
    delete from dept_record
    where deptno = v_deptno;
end;
/

-- ���ǹ�
declare
    vempno number(4);
    vename varchar2(10);
    vdeptno varchar2(10);
    vdname varchar2(10) := null;
begin
    select empno,ename,deptno
    into vempno,vename,vdeptno
    from emp
    where empno = 7788;
    
    if(vdeptno = 10)then  
        vdname := 'AAA';
    end if;
    
    if(vdeptno = 20)then  
        vdname := 'BBB';
    end if;
    
    if(vdeptno = 30)then 
        vdname := 'CCC';
    end if;
    
    if(vdeptno = 40)then  
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
    
end;
/

declare
    -- %rowtype : ���̺��� ��� �÷��� �̸��� ������ �����Ѵ�.
    -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
    vemp emp%rowtype;
begin
    select *
    into vemp
    from emp
    where empno = 7788;
    
    dbms_output.put_line(vemp.empno);
    dbms_output.put_line(vemp.ename);
    dbms_output.put_line(vemp.deptno);
    dbms_output.put_line(vemp.job);
    dbms_output.put_line(vemp.mgr);
    dbms_output.put_line(vemp.sal);
end;
/

-- ��Į�� ���
-- ���۷��� ���
    -- 1. emp.empno%type
    -- 2. emp%rowtype
    
-- ����� ���� ���� Ÿ��
    -- 1. ���̺� type
    -- 2. ���ڵ� type
    
declare
    vemp emp%rowtype;
    annsal number(7,2);
begin
    

    dbms_output.put_line(' ��� / �̸� / ����');
    dbms_output.put_line('-----------------');
    
    select *
    into vemp
    from emp
    where empno = 7788;
    
    if(vemp.comm is null)then
        vemp.comm := 0;
    end if;
    
    annsal := vemp.sal*12 + vemp.comm;
    
    dbms_output.put_line(vemp.empno || ' / ' || vemp.ename || ' / ' || annsal);
    
    -- �ش� ����� ������ ����Ͻÿ� �� Ŀ�̼��� null�� ��� 0���� ���ǰ� �Ͻÿ�
    -- ���� ������ ���� annsal�� �־ ����ϼ���
end;
/
    

declare
    vemp emp%rowtype;
    vdname varchar2(10);
begin
    select *
    into vemp
    from emp
    where empno = 7788;
    
    if(vemp.deptno = 10) then
       vdname := 'AAA';
    elsif(vemp.deptno = 20) then
        vdname := 'BBB';
    elsif(vemp.deptno = 30) then
        vdname := 'CCC';
    elsif(vemp.deptno = 40) then
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
end;
/

    
-- ���ǹ�
-- if then end if;
-- if then else end if;
-- if then elsif then end if;


-- �ݺ���
    -- 1. loop end loop;
    -- 2. for in loop end loop
    -- 3. while loop end loop; 

-- loop
    -- ���๮ (���� �ݺ���)
    -- ���� �ݺ����� ����
        -- 1. exit when ���ǽ�;
        -- 2. if then end if;
-- end loop;

declare
    n number := 1;
begin
    loop
        dbms_output.put_line(n);
        n := n + 1;
        exit when n > 10; -- �ݺ��� ���߱� ���� ����
    end loop;
end;
/


declare

begin
    -- in���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
    for n in reverse 1..10 loop -- in �ּҰ�..�ִ밪 1�� ���� 1 ~ 10 (10ȸ �ݺ�)
        dbms_output.put_line(n);
    end loop;
end;
/


declare
    vdept dept%rowtype;
begin
    for n in 1..4 loop
        select * 
        into vdept
        from dept
        where deptno = 10 * n;
        dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);    
    end loop;
end;
/


declare
    n number := 1;             
begin
    while(n <= 10) loop
        dbms_output.put_line(n);
        n := n + 1 ;
        
    end loop;
    
end;
/

declare

begin
    for n in 1..10 loop
        dbms_output.put_line(n);
    end loop;

end;
/























