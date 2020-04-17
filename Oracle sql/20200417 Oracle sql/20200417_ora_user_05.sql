-- 테이블 명 : dept01
-- 사원번호 PK
-- 이름 null X
-- 사는도시 서울, 경기, 인천
-- 전화번호 유일한 값
-- 5개의 데이터를 넣어보시오.

create table dept01(
emp_id number(4) primary key,
-- primary key : 유일키. 중복허용x, null허용x
name varchar2(20) not null,
-- not null : 중복은 허용되지만 null은 허용하지 않는다.
address varchar2(20) check (address in('서울', '경기', '인천')),
-- check : 특정 범위나 값들만이 테이블에 추가되고 변경되게 한다.
phone varchar(13) unique);
-- unique : 중복허용 X, null은 허용

insert into dept01 values
(1, '홍길동', '서울', '010-1111-1111');

insert into dept01 values
(2, '김유신', '경기', '010-2222-2222');

insert into dept01 values
(3, '강감찬', '인천', '010-3333-3333');

insert into dept01 values
(4, '홍길동', '경기', '010-4444-4444');

insert into dept01 values
(5, '홍길동', '서울', '010-5555-5555');

select * from dept01;

commit;