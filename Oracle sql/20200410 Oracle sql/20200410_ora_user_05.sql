select distinct department_id from employees;
-- distinct : 중복을 제거하고 보여준다.

select distinct department_id from employees order by department_id asc;
-- order by department_id asc : department_id을 오름차순으로 정렬한다.

select distinct department_id from employees order by department_id desc;
-- order by department_id desc : department_id을 내림차순으로 정렬한다.

select employee_id from employees order by employee_id asc;
-- order by department_id asc : department_id을 오름차순으로 정렬한다.

select employee_id from employees order by employee_id desc;
-- order by department_id desc : department_id을 내림차순으로 정렬한다.