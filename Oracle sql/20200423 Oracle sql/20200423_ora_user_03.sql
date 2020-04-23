select emp_name, job_id, salary,
case
when job_id='PU_MAN' then salary*0.05
when job_id='ST_CLERK' then salary*0.1
when job_id='FI_MGR' then salary*0.03
end
as 인상률 from employees where job_id in('PU_MAN', 'ST_CLERK', 'FI_MGR');
-- CASE 문은 if ~ else if 문과 같다.
-- 범위에 대해 처리할 수 있다.
-- CASE WHEN 조건1 THEN 결과1
--      WHEN 조건2 THEN 결과2
--      WHEN 조건3 THEN 결과3
-- 주의 : ',' 없음


select * from stu_score;

insert into stu_score values
('s0006', '홍길자', 99, 88, 80 , 99+88+80, (99+88+80)/3, 0, sysdate, sysdate);

commit;

-- CASE 문은 비교 연산자도 처리할 수 있다.
select stu_num, stu_name, stu_total, stu_avg,
case
when stu_avg >= 90 then 'A'
when stu_avg >= 80 and stu_avg < 90 then 'B'
when stu_avg >= 70 and stu_avg < 80 then 'C'
when stu_avg > 70 then 'D'
end as stu_hak from stu_score;
