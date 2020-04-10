select employee_id, emp_name, salary, salary*12 from employees;
-- employees 테이블에서 employee_id, emp_name, salary, salary*12 칼럼을 보여준다.

select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) from employees;
-- nvl(commission_pct, 0) null이 있는 경우 0으로 변환한다.

select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) as 월급 from employees;
-- as : 컬럼명의 별칭을 줄수 있다.
-- 대소문자 구분 못한다.(대문자로 입력된다.)
select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) "월급" from employees;
-- "월급" 으로도 별칭을 줄수 있다.
-- 입력한 그래도 별칭이 된다.
select employee_id, emp_name, salary+(salary*nvl(commission_pct, 0)) 월급 from employees;
-- as 를 넣지 않아도 별칭을 줄 수 있다.
-- 대소문자 구분 못한다.(대문자로 입력된다.)