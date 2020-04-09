create table member2 (
id varchar(20) primary key,
pw varchar(20),
name varchar(20),
hobby1 number(1,0), -- ����
hobby2 number(1,0), -- ����
hobby3 number(1,0), -- ����
hobby4 number(1,0), -- �丮
gender number(1,0), -- 1: ����, 0: ����
address varchar(20));

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('naver', '1111', '���̹�', 1, 1, 1, 1, 1, '��⵵ �д�');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('daum', '2222', '����', 1, 0, 1, 0, 0, '���ֵ� ���ֽ�');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('google', '333', '����', 1, 0, 0, 0, 1, '�̱�');

insert into member2 values
('nate', '4444', '����Ʈ', 1, 1, 0, 0, 0, '�����');
-- ���� ��� Į���� ���� ��� (id,pw,~~)�� �Է����� �ʾƵ� �ȴ�.

insert into member2 values
('youtube','','��Ʃ��','','','','',0, '�̱�');
-- ���� ������ null�̳� ������� �ִ� ���� ���� �ʴ�.
-- ���� 0�̶� �ִ� ���� ����.

select * from member2;

commit;

delete from member2 where id='youtube';
-- delete from member2; => ������ ���� �����

select * from member2;

rollback;
-- ������ �ǵ�����.
select * from member2;

delete from member2 where id='youtube';
-- delete from member2; => ������ ���� �����
select * from member2;

insert into member2 values
('youtube', '5555', '��Ʃ��', 1, 0, 0, 0, 0, '�̱�');

select * from member2;


