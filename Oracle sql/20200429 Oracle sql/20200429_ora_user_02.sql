-- join --


select * from jobs;

select job_id, job_title from jobs;
select emp_name, job_id from employees;

-- ���� �ΰ� select ���� join �� �� �ִ�.
select employees.emp_name, jobs.job_id, jobs.job_title from employees, jobs
where jobs.job_id = 'FI_MGR' and employees.job_id = jobs.job_id;

-- ���̺� �� ��Ī�� �־� ���� �����ϰ� ���� �� �ִ�.
select emp.emp_name, j.job_id, j.job_title from employees emp, jobs j
where j.job_id = 'FI_MGR' and emp.job_id = j.job_id;


select * from employees;
select * from departments;
-- employees -> employee_id, emp_name, department_id
-- departments -> department_name
-- �� 4���� �÷��� ����϶�.
select e.employee_id, e.emp_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select rownum, e.employee_id, e.emp_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
-- rownum : ���������� ��ȣ�� �ο��Ѵ�.

select rownum, employee_id, emp_name, salary
from (select * from employees where salary>=7000);
-- �� from �� table�� ���� �ʿ�� ����.
-- ������ 7000�� �Ѵ� ����� ���̵� �� �̸��� ����϶�.

-- ����߿� Ne�� �����ϴ� ����� �����ȣ, ����̸�, �μ���ȣ, �μ��̸� �� ����Ͻÿ�.
select e.employee_id, e.emp_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.emp_name like 'Ne%';

select * from departments;
select * from employees;
select * from kor_loan_status;

-- �μ���ȣ�� 20���� �����ȣ, ����̸�, �μ���ȣ, �μ��̸�, �Ի����� ����Ͻÿ�.
select e.employee_id, e.emp_name, d.department_id, d.department_name, e.hire_date
from employees e, departments d
where e.department_id = d.department_id and d.department_id=20;

-- ������ SA_MAN�� ����� �̸�, �μ����� ����Ͻÿ�.
select e.emp_name, d.department_name, e.job_id
from employees e, departments d
where e.department_id = d.department_id and e.job_id='SA_MAN'; 

-- �μ���ȣ�� 50~120 ������ ��� ã��
select e.emp_name, e.department_id, d.department_name, e.job_id
from employees e, departments d
where e.department_id = d.department_id and e.department_id between 50 and 120; 
