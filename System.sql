desc user_tables;

select table_name
from user_tables;

grant create view -- view 테이블을 생성할 수 있는 권한부여, system에서 작동
to scott;

create user name01 identified by 1234; --계정생성

grant CREATE SESSION    --name01에 접속권한 부여
to name01;

grant create table      --name01에 테이블 생성권한 부여
to name01;

drop user user01 cascade;   --name01 삭제

alter user user01 identified by 바꿀 비밀번호; --name01 비밀번호 변경

revoke create table     --name01 테이블 생성권한 회수
from user01;

alter user name01 -- 테이블 스페이스 user에 대한 권한이 없습니다
quota 2m on users;

--롤
create user user02 identified BY 1234;

grant connect,resource --기본적인 권한 부여
to user02;

create user adm identified by 1234; 

grant dba,connect,resource  --관리자랑 같은 권한부여
to adm;

drop user user02;

alter user user04 -- 테이블 스페이스 user에 대한 권한이 없습니다
quota 4m on users;