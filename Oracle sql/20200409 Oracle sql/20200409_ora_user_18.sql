select * from departments;

select department_id, manager_id from departments;

select * from employees;

select employee_id, emp_name, salary, hire_date from employees;
--�����ȣ, ����̸�, �޿�, �Ի� ��¥�� ����� �غ�����.

select emp_name, job_id, salary, salary*1300, salary*1300*12 from employees;
-- ���޿� 1300(ȯ��)�� ���� ��ȭ�� ����غ�����, ������ ����غ�����. 