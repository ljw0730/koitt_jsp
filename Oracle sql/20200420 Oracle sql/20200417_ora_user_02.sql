-- ����ȯ �Լ�

-- ��¥�� ���ڷ� to_cahr

select sysdate from dual;
-- ���� ��¥ �� �ð��� �����´�.

select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
-- to_char() : ����ð��� 'YYYY-MM-DD' ������ char������ �����ش�.

select sysdate, to_char(sysdate, 'YYYY-MON-DD-DAY-DY') from dual;
-- MON -> ���, DAY --> ��������('����'���� ����), DY --> ��������('����'���� �������� ����)

select sysdate, to_char(sysdate,'YYYY/MM/DD hh:mm:ss') from dual;
-- dateŸ���� �⺻������ ��¥�� ���������� �ð��� ����Ǿ��ִ�.
-- to_char(hh:mm:ss)�� ���� �ð��� �� �� �ִ�.

select hire_date, to_char(hire_date, 'YYYY-MM-DD hh24:mm:ss') from employees;
-- dateŸ���� �⺻������ ��¥�� ���������� �ð��� ����Ǿ��ִ�.
-- to_char(hh:mm:ss)�� ���� �ð��� �� �� �ִ�.
-- hh24 : 24�ð� �������� �ð��� ����Ѵ�.

select * from lms_member;

select birth, to_char(birth, 'YYYY-MM-DD hh:mm:ss') as char_birth from lms_member;

select birth, to_char(birth, 'YY/MM/DD DAY') from lms_member;

select hire_date, to_char(hire_date, 'YY-MM-DD DAY hh:mm:ss') as char_birth from employees;
-- employees ���̺��� �Ի����� ��/��/�� ��/��/�� ���� ���

-----------------------------------------------------------------------------------------

-- ���ڸ� ���ڷ� to_char

select to_char(123) from dual;
-- ���� 123 �� ���� 123���� ��ȯ�Ͽ� ����Ѵ�.

select to_char(123456789, '999,999,999') from dual;
-- ���ڸ� ���ڷ� �����Ҷ� 3���������� ','�� �����Ͽ� ��ȯ�Ѵ�.

select salary, to_char(salary*1200, 'L999,999,999') from employees;
-- L : ��ȭ ǥ��(��ȭ)�� �־ �����Ѵ�.

select salary, to_char(salary*1200, '$999,999,999') from employees;
-- $ : ��ȭ ǥ��(�޷�)�� �־ �����Ѵ�.

select salary, to_char(salary*1200, 'L009,999,999') from employees;
-- 0 : ���ڸ��� 0�� ä�� ����Ѵ�.

-----------------------------------------------------------------------------------------

-- ���ڸ� ��¥�� to_date

select emp_name, hire_date from employees
where hire_date=to_date(20050817, 'YYYYMMDD');
-- ���ڸ� ���ڷ� ������ ���� ��¥�� ��ȯ�Ѵ�.

-- ������ date�� varchar2 �� ��¥ ���̸� Ȯ���ϱ� ���� ���̺� ����
create table m0420_1 (
m_name varchar2(20),
m_date date,
v_date varchar(20));

insert into m0420_1 values
('ȫ�浿', '20/04/20', '20/04/20');

insert into m0420_1 values
('������', '20/04/20', '20/04/19');

insert into m0420_1 values
('������', '20/04/20', '20/04/18');

insert into m0420_1 values
('������', '20/04/20', '20/04/17');

insert into m0420_1 values
('�豸', sysdate, '20/04/17');

commit;

select * from m0420_1;

select * from m0420_1 where to_date(m_date,'YY/MM/DD') = to_date(sysdate, 'YY/MM/DD');
-- ���� �Է��� �ο츦 ã�� ���
-- ��/��/�� ������ ���� �� ����

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1;

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1
where m_date = '20/04/20';
-- ���ڷ� �˻��ص� �����ϴ�.

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1
where m_date = to_date('20/04/20');
-- ���ڸ� to_date�� �� ��Ȳ�Ͽ� �˻� �� �� �� �ִ�.

select * from m0420_1
where m_date = to_date(v_date, 'YY/MM/DD');
-- ���ڸ� ��¥�� �����Ͽ� �˻��ϱ�.