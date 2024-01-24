create table employees_role as select * from employees where 1=0; 

select * from employees;
select * from employees_role;

insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',  TO_DATE('1989-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('1989-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(101, 'Nee', 'Ko', 'NKOCHHAR', '515.123.4568', TO_DATE('1989-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('1989-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(200, 'Nee', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('1989-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000.00, NULL, 100, 90);
insert into employees_role values(300, 'GilDong', 'Hong', 'NKOCHHAR', '010-123-4567', TO_DATE('2009-03-01', 'YYYY-MM-DD'), 'IT_PROG', 23000.00, NULL, 100, 90);

commit;

select employee_id, last_name from employees
union all
select employee_id, last_name from employees_role order by 1;

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
where DEPARTMENT_ID = 10
UNION
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM employees_role
where JOB_ID = 'IT_PROG';
