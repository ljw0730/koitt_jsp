select department_id, avg(salary) from
employees
group by department_id;
-- �μ��� ���� ����� ���϶�.

select department_id, to_char(avg(salary), '99999.99') as avg_sal from
employees
group by department_id;
-- �μ��� ���� ����� ���϶�.
-- to_char�� �Ҽ��� ���δ� 5�ڸ�, �Ҽ����� 2°�ڸ��� ǥ���Ѵ�.
-- to_char�� ���� number �� �ƴ� char �� ����.
-- as �� ���� �÷����� avg_sal �� ���´�.

