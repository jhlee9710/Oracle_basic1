select to_char(date_of_birth,'yyyy-mm-dd') as �������,
round((sysdate - date_of_birth)/365) ||'��' as ����
from customers;

select round((sysdate - date_of_birth)/365) as ����,
case
    when round((sysdate - date_of_birth) / 365) >= 10 and round((sysdate - date_of_birth) / 365) < 20 then '10��'
    when round((sysdate - date_of_birth) / 365) >= 20 and round((sysdate - date_of_birth) / 365) < 30 then '20��'
    when round((sysdate - date_of_birth) / 365) >= 30 and round((sysdate - date_of_birth) / 365) < 40 then '30��'
    when round((sysdate - date_of_birth) / 365) >= 40 and round((sysdate - date_of_birth) / 365) < 50 then '40��'
    when round((sysdate - date_of_birth) / 365) >= 50 and round((sysdate - date_of_birth) / 365) < 60 then '50��'
    when round((sysdate - date_of_birth) / 365) >= 60 and round((sysdate - date_of_birth) / 365) < 70 then '60��'
    when round((sysdate - date_of_birth) / 365) >= 70 and round((sysdate - date_of_birth) / 365) < 80 then '70��'
    when round((sysdate - date_of_birth) / 365) >= 80 and round((sysdate - date_of_birth) / 365) < 90 then '80��'
    else '��Ÿ'
    end as ���ɴ�
from customers;


