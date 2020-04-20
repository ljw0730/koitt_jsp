-- nvl

select salary, salary+(salary*nvl(commission_pct, 0)) from employees;
-- commission_pct�� null�� ����� 0���� �ؼ� ����Ѵ�.

select manager_id from employees;
-- manager_id �� ����� id�̴�.
-- ������ ��簡 ���� ������ null ���̴�.

select emp_name, nvl(to_char(manager_id), 'CEO') from employees;
-- manager_id�� number���̹Ƿ� �������� CEO�� ��� ���� ����.
-- to_char�� �̿��� ���ڷ� �����Ѵ�.