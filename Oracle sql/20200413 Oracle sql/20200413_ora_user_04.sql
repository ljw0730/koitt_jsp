select manager_id from employees;

-- 중복제거
select distinct manager_id from employees;

-- 오름차순 정렬
select distinct manager_id from employees order by manager_id asc;

-- manager_id가 100 인 사람
select distinct manager_id from employees where manager_id='100' order by manager_id asc;

-- null이 아닌사람 들의 오름차순
select distinct manager_id from employees
where manager_id is not null order by manager_id asc;