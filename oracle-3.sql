select LAST_DAY(SYSDATE)-sysdate as 남은날짜 
from dual;

SELECT * FROM EMPLOYEES;

select LAST_NAME,
       to_char(HIRE_DATE, 'DD-mon- yyyy') as HIRE_DATE 
from EMPLOYEES
WHERE HIRE_DATE < '2005-01-01';
--WHERE to_char(to_date(HIRE_DATE,'DD-MM-RRRR'), 'RRRR') < 2005;


SELECT count(nvl(COMMISSION_PCT,0)) as "no commission" FROM EMPLOYEES WHERE COMMISSION_PCT is null;
SELECT COUNT(*) FROM EMPLOYEES WHERE COMMISSION_PCT is null;