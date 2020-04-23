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
's0001', '홍길동', 100, 100, 100, 300, 300/3, 0, sysdate, sysdate);

insert into stu_score values(
's0002', '김유신', 90, 90, 90, 270, 270/3, 0, sysdate, sysdate);

insert into stu_score values(
's0003', '유관순', 80, 80, 80, 240, 240/3, 0, sysdate, sysdate);

insert into stu_score values(
's0004', '김구', 90, 90, 90, 270, 270/3, 0, sysdate, sysdate);

insert into stu_score values(
's0005', '강감찬', 70, 70, 70, 210, 210/3, 0, sysdate, sysdate);

select * from stu_score order by stu_num asc;

commit;



select stu_num, stu_name, stu_total, stu_avg,
decode(stu_avg,
70, 'D',
80, 'C',
90, 'B',
100, 'A') as 학점
from stu_score;
-- decode문은 switch 문과 같다.
-- 조건식에 범위가 들어가면 처리할 수 없다.
-- DECODE(컬럼명, 조건1, 결과1,
--               조건2, 결과2,
--               조건3, 결과3) as 별칭