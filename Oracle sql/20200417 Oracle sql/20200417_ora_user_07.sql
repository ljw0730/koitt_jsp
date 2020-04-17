-- ������ �̸� : emp02_seq
-- ���� 1000, ���� 2, �� 10000
-- table dapt02
-- num -> ������ �̿�
-- name
-- date -> �ڵ��Է�

create sequence emp02_seq
-- �������� �����Ѵ�.
increment by 2
-- 2�� ������Ų��.
start with 1000
-- ������ 1000���� �Ѵ�.
minvalue 1000
-- �ּҰ��� 1000���� �Ѵ�.
maxvalue 10000
-- �ִ밪�� 10000 �����Ѵ�.
nocycle;
-- 10000�̻��̸� ó������ ���� �ʴ´�.

create table dept02 (
emp_num number(5) primary key,
name varchar2(20) not null,
hire_date date default sysdate);

insert into dept02(emp_num, name) values
(emp02_seq.nextval, 'ȫ�浿');
-- �������� ����Ͽ� ���� �ִ´�.

insert into dept02(emp_num, name) values
(emp02_seq.nextval, '�豸');

select * from dept02;

select emp02_seq.currval from dual;
-- ������ �����ȣ Ȯ��

commit;

insert into dept02(emp_num, name) values
(emp02_seq.nextval, '������');

-- ������ ������ ����
alter sequence emp02_seq
increment by 1;