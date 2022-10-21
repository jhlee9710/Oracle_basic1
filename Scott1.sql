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

--함수
--문자함수: upper, lower, substr, instr, replace, lpad, rpad, concat
--숫자함수
--날짜함수

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

---숫자---

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
CEIL(3.14),     --자신보다 큰 가장 가까운 정수 4
FLOOR(3.14),    --자신보다 작은 가장 가까운 정수 3
CEIL(-3.14),    -- -3
FLOOR(-3.14)    -- -4
FROM dual;

SELECT MOD(5,2), MOD(10,4)
FROM dual;

SELECT *
FROM emp
WHERE MOD(empno, 2) = 1;

--날짜 데이터를 다루는 날짜 함수
--오늘
select sysdate
from dual;

--어제
select sysdate -1
from dual;

--내일
select sysdate +1
from dual;

--차이가 일수 반환
select sysdate - hiredate as 근무일수
from emp;

--근속년수
select trunc((sysdate-hiredate)/365) as 근무일수
from emp;
--포맷 모델
--CC: 네 자리 연도의 끝 두 자리를 기준으로 사용(2022년은 2050년 이하이므로 반올림 할 경우 2001년으로 처리).
--YYYY: 날짜 데이터의 해당 연, 월, 일의 7월 1일을 기준(2022년 10월 19일 일 경우, 2023년으로 처리).
--Q: 각 분기의 두 번째 달의 16일 기준(아직 11월 15일이 넘지 않았으므로 22년 10월 1일).
--DDD: 해당 일의 정오(12:00:00)를 기준(정오가 넘지 않았으므로 22년 10월 19일).
--HH: 해당일의 시간을 기준(22년 10월 19일 10:49 이므로 반올림해도 22년 10월 19일).
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

--자료형변환 함수
--to_char()
--to_number()
--to_date()

--날짜를 문자
select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') as 입사일자
from emp;

--숫자를 문자
select to_char(123456, '999,999')
from dual;

select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L999,999')
from emp;

--문자를 숫자로
select '20000' - 10000
from dual;

select 20000 - '10000'
from dual;

select '20000' - '5000'
from dual;

--to_number() 형변환을 해야한다.
select '20,000' - '5,000'
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜로
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');


-- null 데이터 처리
-- nvl(null,바꾸고 싶은 데이터)
-- nvl은 null 데이터의 타입과 같은 타입을 변경해야한다.
-- nvl(숫자,숫자), nvl(문자,문자)

-- select ename 사원명,sal,sal*12 + nvl(comm,0) as 연봉,comm
-- from emp;

select *
from emp;

select *
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr),'CEO') as MGR
from emp
where mgr is null;

-- 조건문 표현하는 함수
-- decode() -> switch
-- case     -> if

select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타')
from emp;

-- case 범위를 조건으로 설정할 수 있다.
--    when 조건식   then 실행문
--    when 조건식   then 실행문
--    when 조건식   then 실행문
--    when 조건식   then 실행문
--    else
-- end as 별칭

select ename,job,deptno,
    case
        when deptno = 10 then 'AAA'
        when deptno = 20 then 'BBB'
        when deptno = 30 then 'CCC'
        else '기타'
        end as 부서명
from emp;

select ename,job,sal,
    case 
    when sal between 3000 and 5000 then '임원'
    when sal >= 2000 and sal < 3000 then '관리자'
    when sal >= 500 and sal < 2000 then '사원'
    else '기타'
    end as 직급
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
-- select 컬럼명
-- from 테이블명
-- where 조건식(그룹함수 사용불가/group by, having 보다 먼저실행)
-- group by 기준컬럼명
-- having 조건식
-- order by 컬럼명 정렬방식 ==> 맨 마지막에 작성

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
having avg(sal) >= 2000; -- group by에 의해서 조회 결과에 조건을 준다. 조건식을 작성할때 그룹함수를 사용한다.

select avg(sal)
from emp
where deptno !=10
group by deptno;

select deptno, job, sal
from emp
where sal<=3000
order by deptno,job;

-- 조인(join)
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개이상의 테이블을 작성한다.
-- where에 조인 조건을 작성한다
-- cross join (where절 없이 조인)
-- equi join  (where 등가연산자 : =)
-- non equi join  (where 범위연산자 : and, or)
-- self join (where 하나의 테이블을 사용한다)
-- out join (where에 누락되는 데이터를 같이 조회하기위해 : (+)) // [left. right, full] outer join

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d -- 테이블에 별칭부여
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
from emp e,emp m    -- 반드시 별칭부여
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

-- 외부조인
-- 등가시 누락되는 데이터를 같이 조회하기 위해서 사용한다.

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno;

-- ANSI-JOIN(표준조인 방식)
select ename,sal,dname,loc
from emp inner join dept
on emp.deptno = dept.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- 양쪽 테이블의 컬럼명이 동일할때 가능
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
using (deptno) -- using은 식별자를 따로 쓰면 오류 (select,order 문에서 e.deptno -> deptno)
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

-- DALLAS 에서 근무하는 사람들의 이름과 부서 번호구하기
select ename,deptno
from emp
where deptno = (
                    select deptno
                    from dept
                    where loc = 'DALLAS'
                );
                
-- 자신의 직속상관이 KING인 사원의 이름과 급여를 조회하세요(서브쿼리)

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

--DML(데이터조작어): insert, update, delete
--insert: 테이블에 데이터 삽입
--insert into 테이블명 (컬럼명1, 컬럼명2,...)
--values (값1, 값2, ...)
--컬럼과 값의 타입과 갯수가 일치해야 한다.
--작성 순서대로 1:1 매칭된다.

--테이블 생성하기
create table dept_temp
as
select * from dept;

select *
from dept_temp;

--테이블 데이터 삽입
insert into dept_temp (deptno, dname, loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --컬럼 생략, 모든 컬럼에 데이터를 넣겠다는 의미
values (70,'HTML','SEOUL');

insert into dept_temp (deptno, dname)  --묵시적 NULL 데이터 삽입
values(60,'JSP');

insert into dept_temp   --컬럼생략, 명시적 NULL 데이터 삽입
values (80, NULL, 'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;


select *
from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

--update: 컬럼의 데이터를 변경(수정)
--update 테이블명
--set 컬럼명 = 값, 컬럼명 = 값 ...
--where 조건식
--조건식을 사용하지 않으면 해당 컬럼이 모두 변경된다.

drop table dept_temp2;  -- 테이블 삭제

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


--delete(데이터 삭제)
--delete from 테이블명
--where 조건식
--조건절을 사용하지 않으면 모든 데이터가 삭제된다.

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';


--TCL(데이터의 영구저장 또는 취소)
--트랜젝션
--commit, rollback, savepoint
--commit: 데이터 영구저장(테이블이 데이터 반영)
--        commit구문을 사용해서 객체생성할때(자동)
--rollback: 데이터 변경 취소(테이블이 데이터 미반영), 원상복구
--          천재지변, 전기, 전쟁(자동)
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

-- DDL(데이터 정의어) : table(모든객체)를 생성, 삭제, 변경하는 명령어
-- create(생성), alter(변경). drop(삭제)

create table emp_ddl(
        --사번,이름,직책,관리자,입사일,급여,성과급,부서번호
        empno number(4),
        ename varchar2(10), -- byte -- 알파벳은 한글자에 1byte 한글은 한글자에 2byte
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

create table dept_ddl -- 테이블의 복사
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
-- 테이블 변경(컬럼의 정보 수정)
-- 새로운 컬럼 추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제
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

--==================================== 324p 문제풀이

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
-- 데이터 사전
desc user_tables;


select table_name
from user_tables;

--======================================
-- index (검색속도를 향상하기 위해 사용 객체)
-- select 구문의 검속을 향상 시킨다.
-- 전체 레코드의 3%~5% 정도일때
-- index 객체를 컬럼에 생성해서 사용한다.

create index 인덱스명
on 테이블명 (컬럼명);

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

-- 테이블 삭제 후 원복

show recyclebin;  -- 휴지통 목록 보기
flashback table emp_temp    -- 휴지통에 있는 테이블 복구
to before drop;

purge recyclebin; -- 휴지통 비우기

-- 제약조건 (무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는것
-- not null : 해당 컬럼에 null값은 넣을 수 없다.
-- unique : 
-- primary key
-- foreign key
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
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (2222,'홍길동',null,30);

insert into emp02
values (null,'김유신','SALESMAN',30);

select * from emp02;




    








