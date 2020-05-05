select department_id, avg(salary) from
employees
group by department_id;
-- 부서별 월급 평균을 구하라.

select department_id, to_char(avg(salary), '99999.99') as avg_sal from
employees
group by department_id;
-- 부서별 월급 평균을 구하라.
-- to_char로 소수점 위로는 5자리, 소수점은 2째자리를 표기한다.
-- to_char에 의해 number 가 아닌 char 로 들어간다.
-- as 에 의해 컬럼명이 avg_sal 로 나온다.

