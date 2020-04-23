-- �ο� ���� ��ȯ�Ѵ�.
select count(*) from employees;

-- ���� �հ踦 ��ȯ�Ѵ�.
select sum(salary) from employees;

-- ����� ��ȯ�Ѵ�.
select avg(salary) from employees;

-- �������� ��ȯ�Ѵ�.
select min(salary) from employees;

-- �ִ밪�� ��ȯ�Ѵ�.
select max(salary) from employees;

select * from employees;
select emp_name, department_id, commission_pct from employees;

-- Ŀ�̼� �޴� ����� ��
select count(commission_pct) from employees;

-- Ŀ�̼� �޴� ����� �μ���ȣ�� 80 ���� ����� ��
select count(commission_pct) from employees where department_id = 80;
-- NULL ���� ��� ������ count�� �߰� ���� �ʴ´�.

-- �Ϲ� �÷��� �׷��Լ��� ���ÿ� �˻��� �� ����.
select emp_name, min(salary) from employees;
-- �˻����� �Ϸ��� group by �� ����ؾ� �Ѵ�.

-- �μ��� �μ���ȣ�� ����϶�.
select department_id from employees group by department_id;
select distinct department_id from employees;
-- group by �� ���� �ߺ��� ��Ÿ���� �ʴ´�.

-- department_id �׷��� salary ����� ����.
-- (�μ��� �������)
select department_id, count(nvl(department_id, 1)), avg(salary) from employees
group by department_id;

-- �μ��� ���� �ִ밪 �ּҰ� �� ã�ƶ�.
select department_id, max(salary), min(salary)
from employees group by department_id;


-- �μ��� ������� Ŀ�̼��� �޴� ������� ã�ƶ�.
select department_id, count(department_id), count(commission_pct)
from employees group by department_id;

-- group by�� ������ �ְ� �ʹٸ� having
-- where�� �ȵǹǷ� �����ؾ��Ѵ�.
select department_id, count(department_id), count(commission_pct)
from employees
group by department_id having department_id > 60;

-- �μ��� ���� �ִ밪 �ּҰ� �� ã�ƶ�.(max�� 5000�̻��� ���� �ѷ���)
select department_id, max(salary), min(salary)
from employees group by department_id having max(salary)>=5000;