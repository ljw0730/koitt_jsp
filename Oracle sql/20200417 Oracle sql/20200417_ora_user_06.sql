create table student (
s_num number(4) primary key,
-- primary key : ����Ű. �ߺ����x, null���x
s_name varchar2(20) not null,
-- not null : �ߺ��� �������� null�� ������� �ʴ´�.
s_kor number(3) check(s_kor between 0 and 100),
-- check : Ư�� ������ ���鸸�� ���̺� �߰��ǰ� ����ǰ� �Ѵ�.
s_eng number(3) check(s_eng between 0 and 100),
s_math number(3) check(s_math between 0 and 100),
s_total number(4) check(s_total between 0 and 300),
s_avg number(4,1) check(s_avg >= 0),
s_rank number(5) default 0,
-- default 0 : s_rank�� ���� ���� ������ 0�� �ִ´�.
s_address varchar2(20) default '����',
s_date date default sysdate
);

commit;

insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg) values (
1, 'ȫ�浿', '100', '100', '100', 300, 300/3);

select * from student;

-- ������ ����
create sequence b_seq
-- �������� �����Ѵ�.
increment by 1
-- 1�� ������Ų��.
start with 1
-- 1���� �����Ѵ�.
minvalue 1
-- �ּҰ��� 1�� �Ѵ�.
maxvalue 10000
-- �ִ밪�� 10000�����Ѵ�.
nocycle
-- 10000�̻��̸� ó������ ���� �ʴ´�.
;

-- �Ӽ��� ����
alter table student modify(s_num number(5));

desc student;

select * from student;

delete from student where s_num=1;

commit;

-- ������ �̿��ؼ� s_num �Է� 
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg) values
(b_seq.nextval, 'ȫ�浿', 100, 100, 99, (100+100+99), (100+100+99)/3);

select * from student;

-- ������ �̿��ؼ� s_num �Է�
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg, s_address) values
(b_seq.nextval, '������', 100, 80, 80, (100+80+80), (100+80+80)/3, '���');

select * from student;

-- ������ �̿��ؼ� s_num �Է�
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg, s_address) values
(b_seq.nextval, '�豸', 90, 80, 90, (90+80+90), (90+80+90)/3, '��õ');

select * from student;

-- ������ �����ȣ Ȯ��
select b_seq.currval from dual;