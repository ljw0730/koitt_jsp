-- 날짜 함수

select sysdate from dual;
-- 시스템에서 현재 날짜 및 시간을 가져온다.

select sysdate, sysdate+365 as validity from dual;
-- 현재 날짜와 1년후의 날짜를 구한다.
-- 주로 1년후에 회원유지? 메일을 보내기 위해 사용한다.

select hire_date, round(sysdate-hire_date) from employees;
-- 현재 날짜를 통해 고용후 현재 까지의 근무 일수를 알 수 있다.
-- /365로 나누면 년차도 알 수 있다.
-- /365*12 하면 달수도 알 수 있다.
-- round(a, b) b 안에 아무것도 안넣으면 소수점 첫째자리에서 반올림한다.

select hire_date, round(months_between(sysdate, hire_date))
from employees;
-- months_between 한수를 통해 달수를 알 수 있다.
-- round(a, b) b 안에 아무것도 안넣으면 소수점 첫째자리에서 반올림한다.

select hire_date, add_months(sysdate, 3)
from employees;
-- add_months(sysdate, n) n 개월 후의 날짜를 보여준다.
-- -(마이너스) 값을 입력하면 n 개월 전의 날짜를 보여준다.

select sysdate ,next_day(sysdate, '토요일') from dual;
-- 돌아오는 토요일에 날짜을 보여준다.
-- 일요일이 한주의 시작이다.

select sysdate, last_day(sysdate) from dual;
-- 현재 달의 마지막 날짜를 보여준다.
