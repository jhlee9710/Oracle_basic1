-- 데이터 정렬
-- select 컬렴명
-- from 테이블명
-- order by 컬럼명(정렬기준이 되는 값) asc/desc

--select *
--from emp
--order by sal asc(오름차순)/desc(내림차순)

select* from emp
order by sal asc;

select* from emp
order by sal desc;

-- 숫자 (1~10), 날짜(과거날짜 ~ 최근날짜), 문자(사전순서)

select * from emp
order by hiredate;

-- 조건검색
-- select 컬럼명
-- from 테이블명
-- where 조건식; <, >, =, != / <>, <=, >=, and, or

select * from emp
where sal >= 3000;

-- and 두가지 이사의 조건이 모두 참인경우
select * 
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;ob

-- 날짜를 조건절에 사용할때
-- '  '
-- 날짜도 크기가 있다
-- 80/12/20 -> 1980 12 20 시간 분 초 요일

select * from emp
where hiredate < '1982/01/01';

--OR 두개 이상의 조건중에 하나 이상 참인 경우
SELECT *
FROM emp
WHERE deptno = 10 or sal >= 2000;

--NOT 논리부정 연산자

SELECT *
FROM emp
WHERE sal != 3000;

SELECT *
FROM emp
WHERE not sal = 3000;

--AND, OR
--범위 조건을 표현 할 때 사용

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

-- like 연산자
-- 값의 일부만 가지고 데이터를 조회한다.
-- 와이드 카드를 사용한다 ( % , _)
-- %는 모든 문자를 대체한다.
-- _는 한 문자를 대체한다.

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

-- null 연산자
-- is null/ is not null

select * from emp 
where comm is null;

-- 집합 연산자
-- 두개의 select 구문을 사용한다.
-- 컬럼의 갯수가 동일해야한다.
-- 컬럼의 타입이 동일해야한다.
-- 컬럼의 이름은 상관없다.
-- 합집합, 교집합, 차집합

select empno, ename, sal, deptno
from emp
where deptno = 10
union all-- 합집합 union(중복제거) union all(중복 미제거)
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
minus -- 차집합 
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename ,sal, deptno
from emp
intersect -- 교집합
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- 총정리
-- where 
-- 비교연산자, 논리연산자, like, is null / is not null, 집합연산자
-- 비교연산자: <, >, <=, >=, =, !=
-- 논리연산자: and, or, not, between and, in
-- like: %: 글자수 상관없이 문자대용 가능 _: 글자수를 취급하며 문자대용 가능
-- null연산자: is null, is not null
-- 집합연산자: union(합집합 중복제거), union all(합집합 중복미제거), minus(차집합), intersect(교집합)


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

select rpad('971018-',14,'*') as 주민번호,
rpad('010-3689-',13,'*') as 전화번호
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

