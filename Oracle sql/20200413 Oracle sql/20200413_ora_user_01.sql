select * from member3;

drop table member2;
drop table member3;

select * from tab;

commit;

create table member2 (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
b_date date);

commit;

select * from member2;

insert into member2 values
('abc', '123', 'ȫ�浿', '20/04/13');

commit;

select * from member2;

-- ���� �ð��� �˻��϶�.
select sysdate from dual;

-- ���� �ð��� �Է��϶�.
insert into member2 values
('bcd', '234', '������', sysdate);

select * from member2;

commit;

-- ��� �����ڷ� ��¥�� ������ �� �ִ�.
select sysdate-1 as ����, sysdate as ����, sysdate+1 as ���� from dual;