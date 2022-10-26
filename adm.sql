create user user03 identified BY 1234;

create role mrole;

grant create session,create table,create view
to mrole;

create user user04 identified by 1234;

grant mrole
to user04;

revoke mrole2
from user04;

create role mrole2;

grant 
to mrole2;

drop role mrole2;

grant mrole2
to user04;

select * from scott.emp;

create role mrole3;

grant mrole3
to name01;

 select * from system_privilege_map;

SELECT *    --롤 목록 보기
FROM DBA_ROLES;

CREATE OR REPLACE FORCE VIEW SYS.DBA_ROLES
(
  ROLE
  ,PASSWORD_REQUIRED
  ,AUTHENTICATION_TYPE
)
AS
  SELECT NAME
       , DECODE(PASSWORD,  NULL, 'NO',  'EXTERNAL', 'EXTERNAL', 'GLOBAL', 'GLOBAL', 'YES')
       , DECODE(PASSWORD,  NULL, 'NONE',  'EXTERNAL', 'EXTERNAL',  'GLOBAL', 'GLOBAL', 'APPLICATION', 'APPLICATION',  'PASSWORD')
  FROM   USER$
  WHERE  TYPE# = 0
  AND  NAME NOT IN ('PUBLIC', '_NEXT_USER');
  

SELECT NAME
       , CTIME
       , DECODE(PASSWORD,  NULL, 'NO',  'EXTERNAL', 'EXTERNAL', 'GLOBAL', 'GLOBAL', 'YES') PASSWORD_REQUIRED
       , DECODE(PASSWORD,  NULL, 'NONE',  'EXTERNAL', 'EXTERNAL',  'GLOBAL', 'GLOBAL', 'APPLICATION', 'APPLICATION',  'PASSWORD') AUTHENTICATION_TYPE
  FROM   USER$
  WHERE  TYPE# = 0
  AND  NAME NOT IN ('PUBLIC', '_NEXT_USER');


