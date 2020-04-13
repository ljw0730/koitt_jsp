select * from employees where hire_date >= '2007/01/01';
-- ��¥�� �񱳰� �����ϴ�.

select * from employees where emp_name >= 't';
-- ���ڸ� �񱳰� �Ұ����ϴ�.

-- �μ� id�� 50�̸鼭 job_id�� "MAN"�� ��� ���� ���
select * from employees where department_id=50 and job_id like '%MAN%';

-- �̸��� ���� T �̰ų� �Ǵ� S �̰ų� �Ǵ� A
select * from employees where emp_name like 'T%' or emp_name like 'S%' or emp_name like 'A%' order by emp_name asc;

-- �μ��� 10, 50, 60 �� ����� �˻��Ͻÿ�.
select * from employees where department_id in(10,50,60);

-- �Ի����� ���������϶�.
select * from employees order by hire_date asc;

-- ������ ��������, �̸��� ��������
select * from employees order by salary desc, emp_name asc;

select -10,abs(-10) from dual;
-- ���밪

select 34.7890, round(34.7890, -1) from dual;
-- ���� ù°�ڸ����� �ݿø�

select trunc(34.5678,2), trunc(34.5678, -1), trunc(34.5678) from dual;
-- trunc ����
-- �ڸ��� ������ ���� ������ �Ҽ� ù°�ڸ����� ����

select trunc(34.5678,2), floor(34.5678) from dual;
-- trunc(����)�� floor(����)�� ����
-- floor�� �ڸ� ���� ���� ������ �����̴�.

select mod(27,2), mod(27,5), mod(27,7) from dual;
-- ������ ��

-- �����ȣ�� Ȧ���� ��� �߿� �̸��� A�� ���� ����� �˻��ϼ���.
select * from employees where mod(employee_id, 2)=1 and emp_name like '%A%' order by employee_id asc;