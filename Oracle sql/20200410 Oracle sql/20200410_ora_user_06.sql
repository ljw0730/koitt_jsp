select distinct job_id from employees;

select * from employees;

-- 월급과 커미션을 더해서 8000달러 이상인 사람을 구하시오.
select * from employees where (salary+(salary*nvl(commission_pct,0)))>=8000 order by salary;

-- 월급이 10000달라 인 사람을 제외한 사람의 수를 구하시오.
select count(salary) from employees where salary != 10000;
-- count(salary) : salary 컬럼이 값이 몇개인지 보여준다.


-- employee_id가 200 번인 사람 출력
select * from employees where employee_id = 200;
-- employee_id가 150 번 이상인 사람(오름차순 정렬)
select * from employees where employee_id >= 150 order by employee_id asc;

-- 급여가 4000 이하인 사원의 사원번호, 사원 이름, 급여를 출력해 보세요.
select employee_id, emp_name, salary from employees
where salary <= 4000 order by salary asc;

-- 급여가 4000~8000 인 사원의 사원번호, 사원 이름, 급여를 출력해 보세요.
select employee_id, emp_name, salary from employees
where salary >= 4000 and salary <= 8000 order by salary asc;