select * from departments;

select department_id, manager_id from departments;

select * from employees;

select employee_id, emp_name, salary, hire_date from employees;
--사원번호, 사원이름, 급여, 입사 날짜만 출력을 해보세요.

select emp_name, job_id, salary, salary*1300, salary*1300*12 from employees;
-- 월급에 1300(환율)을 곱해 한화로 출력해보세요, 연봉도 출력해보세요. 