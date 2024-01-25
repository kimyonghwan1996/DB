create table user1(
idx     number  primary key,
id      varchar2(10) unique,
name    varchar2(10) not null,
phone   varchar2(15),
address varchar2(50),
score   number(6,2)  check(score >= 0 and score <= 100),
subject_code  number(5),
hire_date  date default sysdate,
marriage   char(1)  default 'N'  check(marriage in('Y', 'N')));

select constraint_name, constraint_type
from user_constraints
where table_name='USER1';

create table user2(
idx     number        constraint PKIDX primary key,
id      varchar2(10)  constraint UNID unique,
name    varchar2(10)  constraint NOTNAME not null,
phone   varchar2(15),
address varchar2(50),
score   number(6,2)   constraint CKSCORE check(score >= 0 and score <= 100),
subject_code  number(5),
hire_date  date default sysdate,
marriage   char(1)  default 'N' constraint CKMARR check(marriage in('Y','N')));

select constraint_name, constraint_type
from user_constraints
where table_name='USER2';

INSERT INTO user1(idx, id, name, phone, address, score, subject_code, hire_date, marriage)
VALUES(1, 'aaa', 'kim', '010-000-0000', '서울', 75, 100, TO_DATE('2010-08-01', 'YYYY-MM-DD'), 'Y');

insert into user1(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(2,'bbb','lee','010-000-0000','서울',75,100,TO_DATE('2010-08-01', 'YYYY-MM-DD'),'Y'); 
insert into user3(idx,id,name,phone,address,score,subject_code,hire_date,marriage)
values(3,'abb','lee','010-000-0000','서울',120,100,TO_DATE('2010-08-01', 'YYYY-MM-DD'),'K');
desc user1;

alter table test rename to user3;

alter table user3 add phone varchar2(15);
desc user3;

alter table user3 add constraint UID2 unique(id);

select constraint_name, constraint_type
from user_constraints
where table_name='USER3';

alter table user3 drop constraint UID2;
alter table user3 DROP constraint SYS_C007693;

select *
from user_constraints
where table_name='USER3';

alter table user3 drop column address;
desc user3;
ALTER TABLE user3 ADD no NUMBER PRIMARY KEY;
ALTER TABLE user3 MODIFY NAME VARCHAR2(10);
alter table user3 drop column ADDRESS;

drop table user3;
select * from tab;
purge recyclebin; -- 휴지통 비우기

drop table user1 purge; -- 휴지통에 넣지 않고 바로 삭제
select * from tab;

drop table user2;
select * from tab;

create sequence idx_sql increment by 2 start with 1 maxvalue 9 cycle nocache;
select idx_sql.nextval from dual; -- 다음 시퀀스값 표시(nextval)
select idx_sql.currval from dual; -- 현재 시퀀스값 표시(currtval)
drop sequence idx_sql;
select * from user_sequences;

create  table  book(
no  number primary key,
subject  varchar2(50),
price number,
year date);

insert into book(no, subject, price, year)
values(no_seq.nextval, '오라클 무작정 따라하기', 10000, sysdate);

insert into book(no, subject, price, year)
values(no_seq.nextval, '자바 3일 완성', 15000, to_date('2007-03-01','YYYY-MM-DD'));

insert into book values(no_seq.nextval, 'JSP 달인 되기', 18000, to_date('2010-01-01','YYYY-MM-DD'));

select * from book;
create table user3 as select * from user2 where 1=0;
desc user3;

select constraint_name, constraint_type, search_condition
from user_constraints
where table_name='USER3'; 

create table user4(bunho, irum, juso) 
as select idx, name, address from user1 where id='bbb';

desc user1;

create table dept(
deptno number constraint DNO primary key,
dname varchar2(30) constraint DNAME not null);

create table emp(
empno number constraint ENO primary key,
ename varchar2(30) constraint ENAME not null,
deptno number, 
constraint FKNO foreign key(deptno) references dept on delete set null);

insert into dept(deptno, dname) values(10, '개발부');
insert into dept(deptno, dname) values(20, '영업부');
insert into dept(deptno, dname) values(30, '관리부');
insert into dept(dname) values(40, '경리부');
insert into dept(deptno, dname) values(40, '경리부');

insert into emp(empno, ename, deptno) values(100, '홍길동', 10);
insert into emp(empno, ename, deptno) values(101, '라이언', 20);
insert into emp(empno, ename, deptno) values(103, '어피치', 40);
insert into emp(empno, ename) values(105, '프로도');
insert into emp(ename, deptno) values('콘', 10);--primary key는 NULL허용 안함
commit;

update emp set deptno=30 where ename='프로도';