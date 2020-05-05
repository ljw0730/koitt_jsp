-- join --


select * from jobs;

select job_id, job_title from jobs;
select emp_name, job_id from employees;

-- 위의 두개 select 문을 join 할 수 있다.
select employees.emp_name, jobs.job_id, jobs.job_title from employees, jobs
where jobs.job_id = 'FI_MGR' and employees.job_id = jobs.job_id;

-- 테이블 명에 별칭을 주어 좀더 간결하게 만들 수 있다.
select emp.emp_name, j.job_id, j.job_title from employees emp, jobs j
where j.job_id = 'FI_MGR' and emp.job_id = j.job_id;


select * from employees;
select * from departments;
-- employees -> employee_id, emp_name, department_id
-- departments -> department_name
-- 위 4개의 컬럼을 출력하라.
select e.employee_id, e.emp_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select rownum, e.employee_id, e.emp_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
-- rownum : 순차적으로 번호를 부여한다.

select rownum, employee_id, emp_name, salary
from (select * from employees where salary>=7000);
-- 꼭 from 에 table을 넣을 필요는 없다.
-- 월글이 7000이 넘는 사람의 아이디 및 이름을 출력하라.

-- 사람중에 Ne로 시작하는 사람의 사원번호, 사원이름, 부서번호, 부서이름 을 출력하시오.
select e.employee_id, e.emp_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.emp_name like 'Ne%';

select * from departments;
select * from employees;
select * from kor_loan_status;

-- 부서번호가 20번인 사원번호, 사원이름, 부서번호, 부서이름, 입사일을 출력하시오.
select e.employee_id, e.emp_name, d.department_id, d.department_name, e.hire_date
from employees e, departments d
where e.department_id = d.department_id and d.department_id=20;

-- 직급이 SA_MAN인 사원의 이름, 부서명을 출력하시오.
select e.emp_name, d.department_name, e.job_id
from employees e, departments d
where e.department_id = d.department_id and e.job_id='SA_MAN'; 

-- 부서번호가 50~120 사이인 사람 찾기
select e.emp_name, e.department_id, d.department_name, e.job_id
from employees e, departments d
where e.department_id = d.department_id and e.department_id between 50 and 120; 
