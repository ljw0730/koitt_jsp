select manager_id from employees;

-- �ߺ�����
select distinct manager_id from employees;

-- �������� ����
select distinct manager_id from employees order by manager_id asc;

-- manager_id�� 100 �� ���
select distinct manager_id from employees where manager_id='100' order by manager_id asc;

-- null�� �ƴѻ�� ���� ��������
select distinct manager_id from employees
where manager_id is not null order by manager_id asc;