select * from employees where hire_date >= '2007/01/01';
-- 날짜는 비교가 가능하다.

select * from employees where emp_name >= 't';
-- 문자를 비교가 불가능하다.

-- 부서 id가 50이면서 job_id에 "MAN"이 들어 가는 사람
select * from employees where department_id=50 and job_id like '%MAN%';

-- 이름의 성이 T 이거나 또는 S 이거나 또는 A
select * from employees where emp_name like 'T%' or emp_name like 'S%' or emp_name like 'A%' order by emp_name asc;

-- 부서가 10, 50, 60 인 사원을 검색하시오.
select * from employees where department_id in(10,50,60);

-- 입사일을 순차정렬하라.
select * from employees order by hire_date asc;

-- 월급은 역순정렬, 이름은 순차정렬
select * from employees order by salary desc, emp_name asc;

select -10,abs(-10) from dual;
-- 절대값

select 34.7890, round(34.7890, -1) from dual;
-- 정수 첫째자리에서 반올림

select trunc(34.5678,2), trunc(34.5678, -1), trunc(34.5678) from dual;
-- trunc 버림
-- 자리수 지정해 주지 않으면 소수 첫째자리에서 버림

select trunc(34.5678,2), floor(34.5678) from dual;
-- trunc(버림)과 floor(버림)의 차이
-- floor는 자리 수가 없이 무조건 버림이다.

select mod(27,2), mod(27,5), mod(27,7) from dual;
-- 나머지 값

-- 사원번호가 홀수인 사원 중에 이름에 A가 들어가는 사원을 검색하세요.
select * from employees where mod(employee_id, 2)=1 and emp_name like '%A%' order by employee_id asc;