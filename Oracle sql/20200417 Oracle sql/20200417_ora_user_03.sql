create table m_0417_3 (
id number(4) primary key,
pw varchar2(20) not null,
name varchar2(20) unique not null,
-- unique �� not null�� ���ÿ� ����� �� �ִ�.
-- primary key �� ����.
phone varchar2(20));

select * from departments;
select * from employees;