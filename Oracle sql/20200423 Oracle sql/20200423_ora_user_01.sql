create table stu_score(
stu_num varchar2(5),
stu_name varchar2(20),
stu_kor number(3),
stu_eng number(3),
stu_math number(3),
stu_total number(3),
stu_avg number(5,2),
stu_rank number(4),
stu_date date,
stu_mdate date);

insert into stu_score values(
's0001', 'ȫ�浿', 100, 100, 100, 300, 300/3, 0, sysdate, sysdate);

insert into stu_score values(
's0002', '������', 90, 90, 90, 270, 270/3, 0, sysdate, sysdate);

insert into stu_score values(
's0003', '������', 80, 80, 80, 240, 240/3, 0, sysdate, sysdate);

insert into stu_score values(
's0004', '�豸', 90, 90, 90, 270, 270/3, 0, sysdate, sysdate);

insert into stu_score values(
's0005', '������', 70, 70, 70, 210, 210/3, 0, sysdate, sysdate);

select * from stu_score order by stu_num asc;

commit;



select stu_num, stu_name, stu_total, stu_avg,
decode(stu_avg,
70, 'D',
80, 'C',
90, 'B',
100, 'A') as ����
from stu_score;
-- decode���� switch ���� ����.
-- ���ǽĿ� ������ ���� ó���� �� ����.
-- DECODE(�÷���, ����1, ���1,
--               ����2, ���2,
--               ����3, ���3) as ��Ī