create table koitt_member (
id varchar2(20) primary key,
name varchar2(20),
pay number(7),
t_day number(2));

insert into koitt_member(id, name, pay, t_day) values
('ko1', '�㼺��', '30000', '20');

insert into koitt_member values
('ko2', '������', '30000', '20');
-- Į�� ��ü�� ���� �Է��� �Ѵٸ� (id, name, ~~) �κ��� ���� �����ϴ�.

insert into koitt_member values
('ko3', 'ȫ�浿', '30000', '');
-- '' �� null�� ��� ����.
-- null �Ǵ� ������� ���� �ʴ� ���� ����.

insert into koitt_member values
('ko4', '������', '30000', '');

commit;

select * from koitt_member;

select name, pay*nvl(t_day,0) as �̹��޼��� from koitt_member;
-- nvl(t_day,0) : t_day�� null ���� ������ 0���� ����� �޶�
-- as �̹��޼��� : Į���̸��� ��Ī�� �ִ´�.

