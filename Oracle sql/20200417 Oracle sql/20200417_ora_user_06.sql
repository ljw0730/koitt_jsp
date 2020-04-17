create table student (
s_num number(4) primary key,
-- primary key : 유일키. 중복허용x, null허용x
s_name varchar2(20) not null,
-- not null : 중복은 허용되지만 null은 허용하지 않는다.
s_kor number(3) check(s_kor between 0 and 100),
-- check : 특정 범위나 값들만이 테이블에 추가되고 변경되게 한다.
s_eng number(3) check(s_eng between 0 and 100),
s_math number(3) check(s_math between 0 and 100),
s_total number(4) check(s_total between 0 and 300),
s_avg number(4,1) check(s_avg >= 0),
s_rank number(5) default 0,
-- default 0 : s_rank의 값이 들어가지 않으면 0을 넣는다.
s_address varchar2(20) default '서울',
s_date date default sysdate
);

commit;

insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg) values (
1, '홍길동', '100', '100', '100', 300, 300/3);

select * from student;

-- 시퀀스 생성
create sequence b_seq
-- 시퀀스를 생성한다.
increment by 1
-- 1씩 증가시킨다.
start with 1
-- 1부터 시작한다.
minvalue 1
-- 최소값은 1로 한다.
maxvalue 10000
-- 최대값은 10000으로한다.
nocycle
-- 10000이상이면 처음으로 가지 않는다.
;

-- 속성값 변경
alter table student modify(s_num number(5));

desc student;

select * from student;

delete from student where s_num=1;

commit;

-- 시퀀스 이용해서 s_num 입력 
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg) values
(b_seq.nextval, '홍길동', 100, 100, 99, (100+100+99), (100+100+99)/3);

select * from student;

-- 시퀀스 이용해서 s_num 입력
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg, s_address) values
(b_seq.nextval, '유관순', 100, 80, 80, (100+80+80), (100+80+80)/3, '경기');

select * from student;

-- 시퀀스 이용해서 s_num 입력
insert into student(s_num, s_name, s_kor, s_eng, s_math,
s_total, s_avg, s_address) values
(b_seq.nextval, '김구', 90, 80, 90, (90+80+90), (90+80+90)/3, '인천');

select * from student;

-- 시퀀스 현재번호 확인
select b_seq.currval from dual;