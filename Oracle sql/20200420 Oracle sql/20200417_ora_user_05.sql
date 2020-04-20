-- 관리 프로그램을 위한 테이블 생성

create table b_member(
id varchar(20) primary key,
pw varchar(20) not null,
name varchar2(20) not null,
email varchar2(30),
address varchar2(50),
b_date date default sysdate);

insert into b_member(id, pw, name, email, address) values
('admin', '1234', '관리자', 'admin@naver.com', '서울시 디지털단지');

insert into b_member(id, pw, name, email, address) values
('aaa', '123', '홍길동', 'aaa@naver.com', '서울시 디지털단지');

select * from b_member;

commit;