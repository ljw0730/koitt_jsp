-- ���� ���α׷��� ���� ���̺� ����

create table b_member(
id varchar(20) primary key,
pw varchar(20) not null,
name varchar2(20) not null,
email varchar2(30),
address varchar2(50),
b_date date default sysdate);

insert into b_member(id, pw, name, email, address) values
('admin', '1234', '������', 'admin@naver.com', '����� �����д���');

insert into b_member(id, pw, name, email, address) values
('aaa', '123', 'ȫ�浿', 'aaa@naver.com', '����� �����д���');

select * from b_member;

commit;