-- 자격증이 있는 사람에게는 연봉에 50만원을 더해주세요.

create table job_mem2 (
id varchar2(20) primary key,
name varchar2(20),
salary number(5),
comm number(3),
phone varchar2(20),
address varchar2(50));

insert into job_mem2 values
('a001', '홍길동', 400, 1, '010-1111-1111', '서울');

insert into job_mem2 values
('a002', '유관순', 450, '', '010-2222-2222', '경기');

insert into job_mem2 values
('a003', '김유신', 350, '', '010-3333-3333', '인천');

insert into job_mem2 values
('a004', '강감찬', 550, 1, '010-4444-4444', '부산');

insert into job_mem2 values
('a005', '김구', 250, '', '010-5555-5555', '대전');

commit;

select * from job_mem2;

select name, salary*10000, (salary*10000)+(comm*500000) from job_mem2;
-- 자격증이 있는 사람은 월급에 50만원을 추가해서 지급한다고 하자.
-- null 값이 들어가 있으면 null로 나오기 때문에 월급이 안나가게 된다.
select name, salary*10000, (salary*10000)+(nvl(comm,0)*500000) from job_mem2;