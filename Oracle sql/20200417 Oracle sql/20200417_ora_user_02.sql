create table m_0417_2 (
id number(4) primary key,
-- primary key : ����Ű. �ߺ����x, null���x
pw varchar2(20) not null,
-- not null : �ߺ��� �������� null�� ������� �ʴ´�.
name varchar2(20) unique,
-- unique : �ߺ���� X, null�� ���
phone varchar2(20));

insert into m_0417_2 values
('1', '1234', 'ȫ�浿', '010-1111-1111');

insert into m_0417_2 values
('2', '2345', '', '010-2222-2222');

insert into m_0417_2 values
('3', '3456', '', '010-3333-3333');

select * from m_0417_2;

drop table m_0417_2;