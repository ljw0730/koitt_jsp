select * from employees where emp_name='Pat Fay';
-- �̸� �˻��� �� ��ҹ��� ������ �Ѵ�.



-- �̸��� p�� �����ϴ� ����� ����غ�����.
select * from employees where emp_name like 'P%';
-- like 'P%' : P�� �����ϴ�...

-- �̸��� P�� �ִ� ����� ����غ�����.
select * from employees where emp_name like '%P%';

-- �̸��� �ι�° �ڸ��� o �� �ִ� ����� ����غ�����.
select * from employees where emp_name like '_o%';
-- _ �� �߰������� �� ���° �ڸ��� o�� �ִ� ����� ã�� �� �ִ�.