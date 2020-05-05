-- self join --

select * from employees;

select * from employees where employee_id=124;

-- 담당 상사의 매니저 번호와 이름을 출력하라.
select e1.employee_id, e1.emp_name, e1.manager_id, e2.emp_name as manager_name
from employees e1, employees e2 
where e1.manager_id=e2.employee_id;