select 부서ID, 부서평균
from (select nvl(department_id, 5000) "부서ID", 
             round( avg(salary), -3) "부서평균"
      from employees
      group by department_id
      order by department_id asc);

select rownum, last_name, salary
from (select last_name, nvl(salary,0) as salary from employees order by 2 desc)
where ROWNUM < 2;

select  * from 
(select rownum , ceil(rownum/3) as page, tt.* 
from (select last_name, nvl(salary, 0) as salary from employees order by salary desc) tt
) where page=2;

----------------------------------------------------------------------------------
SELECT * 
FROM (SELECT ROWNUM as rn, tt.* 
      FROM (select LAST_NAME as 이름,DEPARTMENT_NAME as 부서명,
            to_char((SALARY*12+(SALARY*12*NVL(COMMISSION_PCT,0))),'L999,999,999') as 연봉 
            FROM EMPLOYEES
            JOIN DEPARTMENTS USING(DEPARTMENT_ID)
            order BY SALARY asc) tt
        )
where rn <=5;



SELECT LAST_NAME as 이름,DEPARTMENT_NAME as 부서명,SALARY as 최대급여
FROM (SELECT DEPARTMENT_NAME,max(SALARY) as SALARY FROM EMPLOYEES
    JOIN DEPARTMENTS USING(DEPARTMENT_ID)
    GROUP by DEPARTMENT_NAME)
LEFT JOIN (SELECT LAST_NAME,DEPARTMENT_NAME,SALARY FROM EMPLOYEES
          JOIN DEPARTMENTS USING(DEPARTMENT_ID)) 
          USING(DEPARTMENT_NAME,SALARY);



SELECT LAST_NAME,DEPARTMENT_NAME,SALARY FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID) 
WHERE (DEPARTMENT_ID,SALARY) IN(
                                SELECT DEPARTMENT_ID,max(SALARY) as SALARY FROM EMPLOYEES 
                                GROUP by DEPARTMENT_ID
                                );