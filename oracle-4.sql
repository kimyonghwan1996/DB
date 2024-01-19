select DISTINCT department_id from employees;
select count(nvl(department_id,0)) from employees;
select count(*) from employees;

select job_id, decode(job_id, 
                     'SA_MAN', 'Sales Dept',
                     'SA_REP', 'Sales Dept',
                     'Another') "분류"
from employees
order by 2;

select job_id, case job_id
                    when 'SA_MAN' then 'Sales Dept'
                    when 'SA_REP' then 'Sales Dept'
                    else 'Another'
              end "분류"
from employees
order by 2;

SELECT EMPLOYEE_ID as "사원번호",
       LAST_NAME as "사원명",
        CASE
            WHEN SALARY < 10000 THEN '초급'
            WHEN SALARY < 20000 THEN '중급'
            ELSE '고급'
        end "구분"
            FROM EMPLOYEES
order BY "구분" ASC,LAST_NAME ASC;

SELECT EMPLOYEE_ID as "사원번호",
        LAST_NAME as "이름",
        SALARY as "급여",
        COMMISSION_PCT as "커미션",
        TO_CHAR(SALARY*12+(SALARY*12*NVL(COMMISSION_PCT,0)),'$999,999,999') as "연봉"
FROM EMPLOYEES;

SELECT EMPLOYEE_ID,LAST_NAME, NVL(MANAGER_ID,'1000') as MANAGER_ID
FROM EMPLOYEES;