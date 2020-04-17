create table m_0417 (
id number(4) primary key,
-- primary key : 유일키. 중복허용x, null허용x
name varchar2(20) not null,
-- not null : 중복은 허용되지만 null은 허용하지 않는다.
pw varchar2(20) not null,
phone varchar2(20));

commit;

desc m_0417;

insert into m_0417 values
('1', '홍길동', '1234', '010-1111-1111');

insert into m_0417 values
('2', '김유신', '2345', '010-2222-2222');

select  * from m_0417;

commit;

insert into m_0417 values
('3', '유관순', '4567', '010-3333-3333');

insert into m_0417 values
('4', '김구', '7890', '');

select  * from m_0417;

drop table m_0417;