-- 시퀀스 이름 : emp02_seq
-- 시작 1000, 증가 2, 끝 10000
-- table dapt02
-- num -> 시퀀스 이용
-- name
-- date -> 자동입력

create sequence emp02_seq
-- 시퀀스를 생성한다.
increment by 2
-- 2씩 증가시킨다.
start with 1000
-- 시작은 1000으로 한다.
minvalue 1000
-- 최소값은 1000으로 한다.
maxvalue 10000
-- 최대값을 10000 으로한다.
nocycle;
-- 10000이상이면 처음으로 가지 않는다.

create table dept02 (
emp_num number(5) primary key,
name varchar2(20) not null,
hire_date date default sysdate);

insert into dept02(emp_num, name) values
(emp02_seq.nextval, '홍길동');
-- 시퀀스를 사용하여 값을 넣는다.

insert into dept02(emp_num, name) values
(emp02_seq.nextval, '김구');

select * from dept02;

select emp02_seq.currval from dual;
-- 시퀀스 현재번호 확인

commit;

insert into dept02(emp_num, name) values
(emp02_seq.nextval, '김유신');

-- 시퀀스 설정값 변경
alter sequence emp02_seq
increment by 1;