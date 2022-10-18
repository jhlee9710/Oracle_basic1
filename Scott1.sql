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


select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select * from emp 
where ename ='FORD';

select *
from emp
where lower(ename) = 'scott';

select ename,length(ename)
from emp;

select 'Welcome to Oracle',substr('Welcome to Oracle',2,5),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle',substr('Welcome to Oracle',-5,6),substr('Welcome to Oracle',-14)
from dual;

select instr('Welcome to Oracle','o')
from dual;

select instr('Welcome to Oracle','o',6)
from dual;

select instr('Welcome to Oracle','e',3,2)
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;

select 'oracle',lpad('oracle',10,'#2f'),rpad('oracle',10,'@')
from dual;

select rpad('971018-',14,'*') as �ֹι�ȣ,
rpad('010-3689-',13,'*') as ��ȭ��ȣ
from dual;

select concat(empno,ename),empno||ename
from emp;

select 
round(1234.5678),
round(1234.5678,1),
round(1234.5678,2),
round(1234.5678,3),
round(1234.5678,-1)
from dual;

select 
trunc(1234.5678),
trunc(1234.5678,1),
trunc(1234.5678,2),
trunc(1234.5678,3),
trunc(1234.5678,-1)
from dual;

select
ceil(3.14),
floor(3.14),
ceil(-3.14),
floor(-3.14)
from dual;


select mod(5,2),mod(10,4)
from dual;

select *
from emp
where mod(empno,2) = 1;

