-- 숫자 함수

--34.56 의 숫자가 있다고 치자
select 34.78, round(34.78), floor(34.78) from dual;
-- round(숫자) : 소수점 첫째자리에서 반올림을 한다.
-- floor(숫자) : 소수점 첫째자리에서 버림을 한다.

select 34.78, trunc(34.5678) from dual;
-- trunc(숫자) : 소수점 첫째자리에서 버림을 한다.

select 34.78, round(34.6789,2) from dual;
-- round(숫자1, 숫자2) : 숫자1을 숫자2 번째자리에서 반올림을 한다.

select 34.78, round(2834.6789, -3) from dual;
-- 소수점 앞으로 반올림을 할경우 숫자2를 - 값을 한다.
