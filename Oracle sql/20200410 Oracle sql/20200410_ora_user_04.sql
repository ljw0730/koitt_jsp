-- 칼럼에 모두 별칭을 달아보세요.
select
employee_id as 사원번호,
emp_name as 이름,
email as 이메일,
phone_number as 전화번호,
hire_date as 입사일,
salary as 월급,
manager_id as 매니저번호,
commission_pct as 인센티브,
retire_date as 퇴사일,
department_id as 부서번호
from employees;