-- ���̺� �� : dept01
-- �����ȣ PK
-- �̸� null X
-- ��µ��� ����, ���, ��õ
-- ��ȭ��ȣ ������ ��
-- 5���� �����͸� �־�ÿ�.

create table dept01(
emp_id number(4) primary key,
-- primary key : ����Ű. �ߺ����x, null���x
name varchar2(20) not null,
-- not null : �ߺ��� �������� null�� ������� �ʴ´�.
address varchar2(20) check (address in('����', '���', '��õ')),
-- check : Ư�� ������ ���鸸�� ���̺� �߰��ǰ� ����ǰ� �Ѵ�.
phone varchar(13) unique);
-- unique : �ߺ���� X, null�� ���

insert into dept01 values
(1, 'ȫ�浿', '����', '010-1111-1111');

insert into dept01 values
(2, '������', '���', '010-2222-2222');

insert into dept01 values
(3, '������', '��õ', '010-3333-3333');

insert into dept01 values
(4, 'ȫ�浿', '���', '010-4444-4444');

insert into dept01 values
(5, 'ȫ�浿', '����', '010-5555-5555');

select * from dept01;

commit;