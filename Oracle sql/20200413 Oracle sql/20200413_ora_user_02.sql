create table member2 (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
b_date date);

insert into member2 values
('abc', '123', 'ȫ�浿', '20/04/13');

-- ���� �ð��� �˻��϶�.
select sysdate from dual;

-- ���� �ð��� �Է��϶�.
insert into member2 values
('bcd', '234', '������', sysdate);

select * from member2;

commit;

select sysdate-1 as ����, sysdate as ����, sysdate+1 as ���� from dual;
-- ��� �����ڷ� ��¥�� ������ �� �ִ�.

select hire_date, hire_date-1 from employees;

-- ��������� �ٹ� �� ��
select sysdate-hire_date as �ٹ��ϼ�, hire_date, hire_date-1 from employees;