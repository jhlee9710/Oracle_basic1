select to_char(date_of_birth,'yyyy-mm-dd') as 생년월일,
round((sysdate - date_of_birth)/365) ||'살' as 나이
from customers;

select round((sysdate - date_of_birth)/365) as 나이,
case
    when round((sysdate - date_of_birth) / 365) >= 10 and round((sysdate - date_of_birth) / 365) < 20 then '10대'
    when round((sysdate - date_of_birth) / 365) >= 20 and round((sysdate - date_of_birth) / 365) < 30 then '20대'
    when round((sysdate - date_of_birth) / 365) >= 30 and round((sysdate - date_of_birth) / 365) < 40 then '30대'
    when round((sysdate - date_of_birth) / 365) >= 40 and round((sysdate - date_of_birth) / 365) < 50 then '40대'
    when round((sysdate - date_of_birth) / 365) >= 50 and round((sysdate - date_of_birth) / 365) < 60 then '50대'
    when round((sysdate - date_of_birth) / 365) >= 60 and round((sysdate - date_of_birth) / 365) < 70 then '60대'
    when round((sysdate - date_of_birth) / 365) >= 70 and round((sysdate - date_of_birth) / 365) < 80 then '70대'
    when round((sysdate - date_of_birth) / 365) >= 80 and round((sysdate - date_of_birth) / 365) < 90 then '80대'
    else '기타'
    end as 연령대
from customers;


