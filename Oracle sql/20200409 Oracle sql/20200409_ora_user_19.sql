select * from employees;

select salary*1300, salary*commission_pct*1300 from employees;

select (salary*1300)+(salary*commission_pct*1300) from employees;
-- commission_pct에 null값이 들어가 있는 곳이 있다.
-- null은 무한대 이기 때문에 더하거나 곱하기를 해도 null이다.
select salary*1300, (salary*1300)+(salary*1300*nvl(commission_pct,0)) from employees;
-- nvl(commition_pct,0) => commition_pct에 null이 있으면 값을 0으로 계산해 달라.

-- 