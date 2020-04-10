select * from employees where hire_date < '07/01/01' order by hire_date asc;
-- ��¥�� �񱳰� �����ϴ�.

--2���� ���� �ѹ��� ����
select * from employees where salary>5000 and department_id=50;
-- ������ 5000�̻��̸鼭 �μ����̵� 50�� ���

select count(*) from employees where salary>5000 and department_id=50;
-- ������ 5000�̻��̸鼭 �μ����̵� 50�� ����� ��

-- ������ 4000�̻��̸鼭 �μ��Ƶ��̰� 30�� ���
select * from employees where salary>=4000 and department_id=30;

-- ������ 3000, 4000, 5000, 6000, 10000 �� ���
select * from employees where
salary=3000 or
salary=4000 or
salary=5000 or
salary=6000 or
salary=10000 order by salary asc;

-- �����ȣ�� 104���̰ų� 150�� �̻��� ����� �˻�
select * from employees where
employee_id=104 or employee_id>150
order by employee_id asc;

-- �����ȣ�� 150~160 �� ���
select * from employees where
employee_id between 150 and 160;
-- between A and B : A �� B ����
-- and�� ����.

-- ������ 5000���� �۰ų� 10000���� ū ���
select * from employees where
salary < 5000 or salary>10000;

select * from employees where
salary not between 5000 and 10000;
-- not between A and B : A �� B ���̸� ������
-- or �� ����.

select * from employees where
hire_date between '00/01/01' and '05/12/31'
order by hire_date asc;
-- ��¥�� between�� �ȴ�.

select * from employees
order by emp_name asc;
-- �̸��� ������ �ȴ�.(��������)(asc-��������, desc-��������)


select * from employees 
where salary=3000 or salary=4000 or salary=5000;

select * from employees
where salary in(3000, 4000, 5000);
-- in(A,B,C,D...) : A �̰ų� B �̰ų� C �̰ų� D �̰ų�...
-- A or B or C or D or ... �� ����.

-- �μ���ȣ�� 30, 40 , 50 �̸鼭 ������ 5000�̻��� ���
select * from employees
where department_id in(30, 40 , 50) and salary>=5000;

--
select * from employees where commission_pct is null;
-- is null : Į�� �ȿ� null ��
-- commission_pct = null ���δ� �ȵǴ�.

