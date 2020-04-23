-- 로우 수를 반환한다.
select count(*) from employees;

-- 누적 합계를 반환한다.
select sum(salary) from employees;

-- 평균을 반환한다.
select avg(salary) from employees;

-- 최저값을 반환한다.
select min(salary) from employees;

-- 최대값을 반환한다.
select max(salary) from employees;

select * from employees;
select emp_name, department_id, commission_pct from employees;

-- 커미션 받는 사람의 수
select count(commission_pct) from employees;

-- 커미션 받는 사람중 부서번호가 80 번인 사람의 수
select count(commission_pct) from employees where department_id = 80;
-- NULL 값이 들어 있으면 count에 추가 되지 않는다.

-- 일반 컬럼과 그룹함수를 동시에 검색할 수 없다.
select emp_name, min(salary) from employees;
-- 검색으로 하려면 group by 를 사용해야 한다.

-- 부서별 부서번호를 출력하라.
select department_id from employees group by department_id;
select distinct department_id from employees;
-- group by 에 의해 중복이 나타나지 않는다.

-- department_id 그룹의 salary 평균을 내라.
-- (부서별 월급평균)
select department_id, count(nvl(department_id, 1)), avg(salary) from employees
group by department_id;

-- 부서별 월급 최대값 최소값 을 찾아라.
select department_id, max(salary), min(salary)
from employees group by department_id;


-- 부서별 사원수와 커미션을 받는 사원수를 찾아라.
select department_id, count(department_id), count(commission_pct)
from employees group by department_id;

-- group by에 조건을 넣고 싶다면 having
-- where로 안되므로 조심해야한다.
select department_id, count(department_id), count(commission_pct)
from employees
group by department_id having department_id > 60;

-- 부서별 월급 최대값 최소값 을 찾아라.(max가 5000이상인 값만 뿌려라)
select department_id, max(salary), min(salary)
from employees group by department_id having max(salary)>=5000;