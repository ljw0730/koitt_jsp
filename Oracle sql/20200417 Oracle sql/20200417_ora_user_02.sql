create table m_0417_2 (
id number(4) primary key,
-- primary key : 유일키. 중복허용x, null허용x
pw varchar2(20) not null,
-- not null : 중복은 허용되지만 null은 허용하지 않는다.
name varchar2(20) unique,
-- unique : 중복허용 X, null은 허용
phone varchar2(20));

insert into m_0417_2 values
('1', '1234', '홍길동', '010-1111-1111');

insert into m_0417_2 values
('2', '2345', '', '010-2222-2222');

insert into m_0417_2 values
('3', '3456', '', '010-3333-3333');

select * from m_0417_2;

drop table m_0417_2;