-- nvl

select salary, salary+(salary*nvl(commission_pct, 0)) from employees;
-- commission_pct에 null인 사람은 0으로 해서 계산한다.

select manager_id from employees;
-- manager_id 는 상사의 id이다.
-- 사장은 상사가 없기 때문에 null 값이다.

select emp_name, nvl(to_char(manager_id), 'CEO') from employees;
-- manager_id는 number형이므로 문자형인 CEO가 들어 갈수 없다.
-- to_char을 이용해 문자로 변경한다.