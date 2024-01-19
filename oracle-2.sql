SELECT FIRST_NAME || ' ' || LAST_NAME as "이 름" FROM EMPLOYEES;

SELECT EMPLOYEE_ID as "사원번호", 
       FIRST_NAME|| ' ' || LAST_NAME as "이 름" 
       SALARY*12 || ' 달러 ' as "연봉" 
FROM EMPLOYEES;

SELECT LAST_NAME || ' is a ' || JOB_ID  as "Employee Detail" FROM EMPLOYEES;

select distinct department_id from employees;

SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME|| ' ' || LAST_NAME as "사원이름", '$' || SALARY as "급여", DEPARTMENT_ID as "부서코드"
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = '90' AND SALARY <= 2500) OR SALARY >= 3000;

SELECT LAST_NAME as "이름", JOB_ID as "업무Id", SALARY || ' 원 ' as "급여"
FROM EMPLOYEES
WHERE SALARY > 10000;

SELECT DISTINCT JOB_ID FROM EMPLOYEES;

SELECT EMPLOYEE_ID as "사원번호", FIRST_NAME|| ' ' || LAST_NAME as "사원이름", HIRE_DATE as "입사일"
FROM EMPLOYEES
--WHERE HIRE_DATE like '%05'; --'05%' or WHERE HIRE_DATE between '2005-01-01' and '2005-12-31'
WHERE TO_CHAR(HIRE_DATE, 'yyyy') = '2005';
