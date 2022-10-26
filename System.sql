desc user_tables;

select table_name
from user_tables;

grant create view -- view ���̺��� ������ �� �ִ� ���Ѻο�, system���� �۵�
to scott;

create user name01 identified by 1234; --��������

grant CREATE SESSION    --name01�� ���ӱ��� �ο�
to name01;

grant create table      --name01�� ���̺� �������� �ο�
to name01;

drop user user01 cascade;   --name01 ����

alter user user01 identified by �ٲ� ��й�ȣ; --name01 ��й�ȣ ����

revoke create table     --name01 ���̺� �������� ȸ��
from user01;

alter user name01 -- ���̺� �����̽� user�� ���� ������ �����ϴ�
quota 2m on users;

--��
create user user02 identified BY 1234;

grant connect,resource --�⺻���� ���� �ο�
to user02;

create user adm identified by 1234; 

grant dba,connect,resource  --�����ڶ� ���� ���Ѻο�
to adm;

drop user user02;

alter user user04 -- ���̺� �����̽� user�� ���� ������ �����ϴ�
quota 4m on users;