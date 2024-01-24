select LAST_NAME, SALARY 
from EMPLOYEES
where SALARY = (select min(SALARY) from employees);

SELECT DEPARTMENT_NAME, sum(SALARY)
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME
HAVING sum(SALARY) = (SELECT MAX(SUM(SALARY)) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);

/*
'IT_PROG' 직급 중 가장 많이 받는 사원의 급여보다 더 많은 급여를 받는 'FI_ACCOUNT' 또는 'SA_REP' 직급 직원들을 조회하시오
조건1) 급여 순으로 내림차순 정렬하시오
조건2) 급여는 세 자리마다 콤마(,) 찍고 화폐단위 '원’을 붙이시오
조건3) 타이틀은 사원명, 업무ID, 급여로 표시하시오
*/
SELECT LAST_NAME, JOB_ID,  TO_CHAR(SALARY*1300,'999,999,999') || '원' as SALARY
FROM EMPLOYEES
where JOB_ID = 'FI_ACCOUNT' or  JOB_ID = 'SA_REP'
    AND SALARY >= all(select SALARY from employees where job_id='IT_PROG')
ORDER by 3;

select employee_id as 사원번호, 
       last_name as 이름,
       case 
			when employee_id in (select manager_id from employees) then '관리자'
            else '직원'
       end as 구분
from employees
order by 3,1;

SELECT LAST_NAME, JOB_ID, JOB_TITLE, SALARY
FROM EMPLOYEES
JOIN JOBS USING(job_id)
where SALARY in (SELECT AVG((MIN_SALARY+ MAX_SALARY)) as avg_sal 
                   FROM JOBS GROUP BY JOB_ID)
ORDER BY SALARY ASC;

select LAST_NAME as 사원이름,
       JOB_ID as 업무ID,
       JOB_TITLE as 직무,
       to_char(trunc(SALARY,-3),'$999,000') as 급여
from EMPLOYEES
join JOBS using(JOB_ID)
where SALARY = any (select avg(SALARY) from EMPLOYEES group by JOB_ID)
order by 4;


SELECT * FROM JOBS;

SELECT JOB_ID, AVG((MIN_SALARY+ MAX_SALARY)) as avg_sal FROM JOBS
GROUP BY JOB_ID;

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT JOB_ID, trunc(avg(SALARY),-3) 
FROM EMPLOYEES 
GROUP BY JOB_ID;

SELECT LAST_NAME,JOB_ID,JOB_TITLE,to_char(trunc(SALARY,-3),'L999,999,999') as SALARY
FROM EMPLOYEES
join JOBS using(JOB_ID)
where (JOB_ID,SALARY) in(SELECT JOB_ID,trunc(avg(SALARY),-3) 
                 FROM EMPLOYEES 
                 GROUP BY JOB_ID)
ORDER by 4;