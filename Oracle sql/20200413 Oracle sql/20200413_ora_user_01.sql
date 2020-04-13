select * from member3;

drop table member2;
drop table member3;

select * from tab;

commit;

create table member2 (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
b_date date);

commit;

select * from member2;

insert into member2 values
('abc', '123', '홍길동', '20/04/13');

commit;

select * from member2;

-- 현재 시간을 검색하라.
select sysdate from dual;

-- 현재 시간을 입력하라.
insert into member2 values
('bcd', '234', '김유신', sysdate);

select * from member2;

commit;

-- 산술 연산자로 날짜를 변경할 수 있다.
select sysdate-1 as 어제, sysdate as 오늘, sysdate+1 as 내일 from dual;