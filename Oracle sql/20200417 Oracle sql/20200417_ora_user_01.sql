create table m_0417 (
id number(4) primary key,
-- primary key : ����Ű. �ߺ����x, null���x
name varchar2(20) not null,
-- not null : �ߺ��� �������� null�� ������� �ʴ´�.
pw varchar2(20) not null,
phone varchar2(20));

commit;

desc m_0417;

insert into m_0417 values
('1', 'ȫ�浿', '1234', '010-1111-1111');

insert into m_0417 values
('2', '������', '2345', '010-2222-2222');

select  * from m_0417;

commit;

insert into m_0417 values
('3', '������', '4567', '010-3333-3333');

insert into m_0417 values
('4', '�豸', '7890', '');

select  * from m_0417;

drop table m_0417;