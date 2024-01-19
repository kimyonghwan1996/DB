select department_id as 부서코드, 
       to_char(round(avg(salary), 0), 'L99,999,999') as 평균급여
from employees
group by department_id     
having avg(salary) >= 5000
order by department_id asc; 

SELECT * FROM EMPLOYEES;

SELECT JOB_ID, SUM(SALARY) as "급여 합계"
FROM EMPLOYEES
group BY JOB_ID;

select department_id, max(salary) as max_salary
from employees
where department_id in(10, 20)
group by department_id
order by department_id;
DROP TABLE sellings;
CREATE TABLE sellings(
    card_id NUMBER,
    EMPLOYEE_ID NUMBER,
    created_at date,
    price NUMBER
);
SELECT * FROM sellings;
INSERT INTO sellings VALUES(352,2455,'2016-08-16',3700);