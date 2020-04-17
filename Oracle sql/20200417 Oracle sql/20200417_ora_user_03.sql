create table m_0417_3 (
id number(4) primary key,
pw varchar2(20) not null,
name varchar2(20) unique not null,
-- unique 와 not null을 동시에 사용할 수 있다.
-- primary key 와 같다.
phone varchar2(20));

select * from departments;
select * from employees;