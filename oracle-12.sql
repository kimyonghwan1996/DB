CREATE or REPLACE VIEW TEST
as SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
where DEPARTMENT_ID = 90;

desc TEST;
SELECT * FROM TEST;

CREATE OR REPLACE VIEW v_view2 (사원id, 사원이름, 급여, 부서id)
as SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
where SALARY BETWEEN 5000 AND 10000;

SELECT * FROM v_view2;

update v_view2 set salary=9000 where employee_id=103;
select * from employees where employee_id=103; 


CREATE OR REPLACE VIEW v_view3 (사원번호, 사원이름, 부서명)
as SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
where DEPARTMENT_ID IN(10,90)
ORDER by EMPLOYEE_ID;

SELECT * FROM v_view3;

CREATE OR REPLACE VIEW v_view4 (사원번호, 사원이름, 연봉, 입사일, 부서명, 부서위치)
as SELECT EMPLOYEE_ID, 
          LAST_NAME, to_char(trunc(SALARY,-3),'999,999,999')||'원',
          to_char(HIRE_DATE,'YYYY"년" MM"월" DD"일"'), 
          DEPARTMENT_NAME,CITY
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
JOIN LOCATIONS USING(LOCATION_ID)
where DEPARTMENT_ID IN(10,90)
ORDER by EMPLOYEE_ID;

SELECT * FROM v_view4;


create or replace view v_view5
as select employee_id, last_name, job_id
from employees
where job_id='IT_PROG'
with read only;

create or replace view v_view6
as select employee_id, last_name, email, hire_date, job_id
from employees
where job_id='IT_PROG'
with check option;

CREATE TABLE bookshop(
    isbn      varchar2(10) constraint PISBN primary key, -- 기본키 (제약조건명 : PISBN)
    title     varchar2(50) constraint CTIT not null,  -- 널값 허용X (제약조건명 : CTIT), 책제목
    author    varchar2(50), -- 저자 
    price     number,-- 금액
    company   varchar2(30)  -- 출판사
);

insert into bookshop values('is001', '자바3일완성', '김자바', 25000, '야메루출판사');
insert into bookshop values('pa002', 'JSP달인되기', '이달인', 28000, '공갈닷컴');
insert into bookshop values('or003', '오라클무작정따라하기', '박따라', 23500, '야메루출판사');
commit;

select constraint_name, constraint_type
from user_constraints
where table_name='BOOKSHOP'; --꼭대문자

CREATE TABLE bookorder(
    idx   number primary key,-- 기본키, 일련번호 
    isbn  varchar2(10) ,-- 외래키 (제약조건명 : FKISBN), bookshop의 isbn의 자식키
    qty   number,
    constraint FKISBN foreign key(isbn) references bookshop
);

-- create table bookorder(
-- idx number primary key,
-- isbn varchar2(10) constraint FKISBN references bookshop(isbn),
-- qty number);

CREATE SEQUENCE idx_seq
-- increment by 1 start with 1 
nocycle nocache;

INSERT INTO bookorder VALUES (idx_seq.NEXTVAL, 'is001', 2);
INSERT INTO bookorder VALUES (idx_seq.NEXTVAL, 'or003', 3);
INSERT INTO bookorder VALUES (idx_seq.NEXTVAL, 'pa002', 5);
INSERT INTO bookorder VALUES (idx_seq.NEXTVAL, 'is001', 3);
INSERT INTO bookorder VALUES (idx_seq.NEXTVAL, 'or003', 10);
commit;

SELECT * FROM bookorder;
SELECT * FROM bookshop;
SELECT * FROM bs_view;

CREATE or REPLACE VIEW bs_view(책제목, 저자, 총판매금액)
as SELECT title as 책제목
      , author as 저자--,author
      , to_char(sum(PRICE*qty),'999,999') as 총판매금액--,author
FROM bookshop
JOIN bookorder USING(isbn)
GROUP BY title, author
WITH READ ONLY;

SELECT title as 책제목
      , author as 저자--,author
      , to_char(sum(PRICE*qty),'999,999') as 총판매금액--,author
FROM bookshop
JOIN bookorder USING(isbn)
GROUP BY title, author;

