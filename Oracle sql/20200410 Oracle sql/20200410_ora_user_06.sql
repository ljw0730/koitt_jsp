select distinct job_id from employees;

select * from employees;

-- ���ް� Ŀ�̼��� ���ؼ� 8000�޷� �̻��� ����� ���Ͻÿ�.
select * from employees where (salary+(salary*nvl(commission_pct,0)))>=8000 order by salary;

-- ������ 10000�޶� �� ����� ������ ����� ���� ���Ͻÿ�.
select count(salary) from employees where salary != 10000;
-- count(salary) : salary �÷��� ���� ����� �����ش�.


-- employee_id�� 200 ���� ��� ���
select * from employees where employee_id = 200;
-- employee_id�� 150 �� �̻��� ���(�������� ����)
select * from employees where employee_id >= 150 order by employee_id asc;

-- �޿��� 4000 ������ ����� �����ȣ, ��� �̸�, �޿��� ����� ������.
select employee_id, emp_name, salary from employees
where salary <= 4000 order by salary asc;

-- �޿��� 4000~8000 �� ����� �����ȣ, ��� �̸�, �޿��� ����� ������.
select employee_id, emp_name, salary from employees
where salary >= 4000 and salary <= 8000 order by salary asc;