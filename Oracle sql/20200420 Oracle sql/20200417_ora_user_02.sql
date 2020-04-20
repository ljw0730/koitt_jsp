-- 형변환 함수

-- 날짜를 문자로 to_cahr

select sysdate from dual;
-- 현재 날짜 및 시간을 가져온다.

select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
-- to_char() : 현재시간을 'YYYY-MM-DD' 형태의 char형으로 보여준다.

select sysdate, to_char(sysdate, 'YYYY-MON-DD-DAY-DY') from dual;
-- MON -> 몇월, DAY --> 무슨요일('요일'글자 포함), DY --> 무슨요일('요일'글자 포함하지 않음)

select sysdate, to_char(sysdate,'YYYY/MM/DD hh:mm:ss') from dual;
-- date타입은 기본적으로 날짜만 보여주지만 시간도 저장되어있다.
-- to_char(hh:mm:ss)을 통해 시간을 볼 수 있다.

select hire_date, to_char(hire_date, 'YYYY-MM-DD hh24:mm:ss') from employees;
-- date타입은 기본적으로 날짜만 보여주지만 시간도 저장되어있다.
-- to_char(hh:mm:ss)을 통해 시간을 볼 수 있다.
-- hh24 : 24시간 기준으로 시간을 출력한다.

select * from lms_member;

select birth, to_char(birth, 'YYYY-MM-DD hh:mm:ss') as char_birth from lms_member;

select birth, to_char(birth, 'YY/MM/DD DAY') from lms_member;

select hire_date, to_char(hire_date, 'YY-MM-DD DAY hh:mm:ss') as char_birth from employees;
-- employees 테이블에서 입사일의 년/월/일 시/분/초 요일 출력

-----------------------------------------------------------------------------------------

-- 숫자를 문자로 to_char

select to_char(123) from dual;
-- 숫자 123 을 문자 123으로 변환하여 출력한다.

select to_char(123456789, '999,999,999') from dual;
-- 숫자를 문자로 변경할때 3개단위마다 ','를 포함하여 변환한다.

select salary, to_char(salary*1200, 'L999,999,999') from employees;
-- L : 통화 표시(원화)를 넣어서 포함한다.

select salary, to_char(salary*1200, '$999,999,999') from employees;
-- $ : 통화 표시(달러)를 넣어서 포함한다.

select salary, to_char(salary*1200, 'L009,999,999') from employees;
-- 0 : 빈자리에 0을 채워 출력한다.

-----------------------------------------------------------------------------------------

-- 숫자를 날짜로 to_date

select emp_name, hire_date from employees
where hire_date=to_date(20050817, 'YYYYMMDD');
-- 숫자를 문자로 변형한 다음 날짜로 변환한다.

-- 유형이 date와 varchar2 의 날짜 차이를 확인하기 위한 테이블 생성
create table m0420_1 (
m_name varchar2(20),
m_date date,
v_date varchar(20));

insert into m0420_1 values
('홍길동', '20/04/20', '20/04/20');

insert into m0420_1 values
('강감찬', '20/04/20', '20/04/19');

insert into m0420_1 values
('유관순', '20/04/20', '20/04/18');

insert into m0420_1 values
('김유신', '20/04/20', '20/04/17');

insert into m0420_1 values
('김구', sysdate, '20/04/17');

commit;

select * from m0420_1;

select * from m0420_1 where to_date(m_date,'YY/MM/DD') = to_date(sysdate, 'YY/MM/DD');
-- 당일 입력한 로우를 찾는 방법
-- 시/분/초 까지는 맞출 수 없음

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1;

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1
where m_date = '20/04/20';
-- 문자로 검색해도 가능하다.

select m_name, m_date, to_char(m_date, 'YY/MM/DD hh:mm:ss'), v_date from m0420_1
where m_date = to_date('20/04/20');
-- 문자를 to_date로 형 변황하여 검색 할 수 도 있다.

select * from m0420_1
where m_date = to_date(v_date, 'YY/MM/DD');
-- 문자를 날짜로 변경하여 검색하기.