create table m_0417_4 (
id number(4) primary key,
-- primary key : ����Ű. �ߺ����x, null���x
name varchar2(20) not null,
-- not null : �ߺ��� �������� null�� ������� �ʴ´�.
salary number(4) check(salary between 500 and 5000),
-- check : Ư�� ������ ���鸸�� ���̺� �߰��ǰ� ����ǰ� �Ѵ�.
gender varchar2(1) check(gender in('M', 'F'))
);

insert into m_0417_4 values
('1', 'ȫ�浿', '500', 'M');

-- salary ������ �����.
insert into m_0417_4 values
('2', '������', '400', 'F');

insert into m_0417_4 values
('2', '������', '5000', 'F');

-- ������ ���� ��ҹ��ڸ� �����Ѵ�.
insert into m_0417_4 values
('3', '�豸', '4500', 'f');

insert into m_0417_4 values
('3', '�豸', '4500', 'F');

commit;

select * from m_0417_4;