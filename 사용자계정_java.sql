@@C:\Oracle\lib\stExe.sql
select * from tab;
select * from emp;

select * from emp
where ename like '김%';

select ENAME,HDATE from emp
where HDATE like '1%';

select ENO, ENAME, SAL*1234 as SAL from emp;

select * from emp
where COMM = 0 or COMM is null;

select * from emp
where JOB = '개발' order by sal desc;
