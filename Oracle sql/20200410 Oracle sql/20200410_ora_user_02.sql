select employee_id, emp_name, salary, salary*12 from employees;
-- employees ���̺��� employee_id, emp_name, salary, salary*12 Į���� �����ش�.

select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) from employees;
-- nvl(commission_pct, 0) null�� �ִ� ��� 0���� ��ȯ�Ѵ�.

select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) as ���� from employees;
-- as : �÷����� ��Ī�� �ټ� �ִ�.
-- ��ҹ��� ���� ���Ѵ�.(�빮�ڷ� �Էµȴ�.)
select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) "����" from employees;
-- "����" ���ε� ��Ī�� �ټ� �ִ�.
-- �Է��� �׷��� ��Ī�� �ȴ�.
select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) ���� from employees;
-- as �� ���� �ʾƵ� ��Ī�� �� �� �ִ�.
-- ��ҹ��� ���� ���Ѵ�.(�빮�ڷ� �Էµȴ�.)