create table m_0417_4 (
id number(4) primary key,
-- primary key : 유일키. 중복허용x, null허용x
name varchar2(20) not null,
-- not null : 중복은 허용되지만 null은 허용하지 않는다.
salary number(4) check(salary between 500 and 5000),
-- check : 특정 범위나 값들만이 테이블에 추가되고 변경되게 한다.
gender varchar2(1) check(gender in('M', 'F'))
);

insert into m_0417_4 values
('1', '홍길동', '500', 'M');

-- salary 범위를 벗어났다.
insert into m_0417_4 values
('2', '강감찬', '400', 'F');

insert into m_0417_4 values
('2', '강감찬', '5000', 'F');

-- 데이터 값은 대소문자를 구분한다.
insert into m_0417_4 values
('3', '김구', '4500', 'f');

insert into m_0417_4 values
('3', '김구', '4500', 'F');

commit;

select * from m_0417_4;