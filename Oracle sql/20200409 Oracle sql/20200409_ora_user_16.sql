create table member (
id varchar(20) primary key,
pw varchar(20),
name varchar(20),
phone varchar(20));

insert into member(id, pw, name, phone) values
('abc', '123','ȫ�浿', '010-1234-5678');

insert into member(id, pw, name, phone) values
('bcd', '123','ȫ�浿', '010-1234-5678');
-- �����̸Ӹ� Ű�� �ߺ��� �ȵ����� �������� �ߺ��� �����ϴ�.

insert into member(id, pw, name, phone) values
('cde', '456','������', '010-2345-6789');

insert into member(id, pw, name, phone) values
('def', '789','������', '010-3456-7890');

select * from member;

commit;

update member set pw='234', name='������',
phone='010-2222-3456'
where id='bcd';

select * from member where id='bcd';
select * from member;

insert into member(id, pw, name, phone) values
('efg', '567', '�豸', '010-5555-6789');

commit;

select * from member;

update member set name='ȫ�浿' where id='efg';

select * from member;

commit;

select * from member where name='ȫ�浿';

select * from member where name='ȫ�浿' and phone='010-5555-6789';
-- �̸��� ȫ�浿 �̰� ��ȭ��ȣ�� 010-5555-6789 �� ����� ã�ƴ޶�.

update member set pw='111' where name='ȫ�浿';
-- �̷��� �ϸ� �̸��� ȫ�浿 �� ����� �н����尡 ���� 111�� �ٲ��.
select * from member;

update member set pw='55555' where name='ȫ�浿' and phone='010-5555-6789';
-- �̸��� ȫ�浿 �̰� ��ȭ��ȣ�� 010-5555-6789 �� ����� ã�Ƽ�
-- ��й�ȣ�� 55555�� �����϶�.
select * from member;
