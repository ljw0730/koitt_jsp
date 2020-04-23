select emp_name, job_id, salary,
case
when job_id='PU_MAN' then salary*0.05
when job_id='ST_CLERK' then salary*0.1
when job_id='FI_MGR' then salary*0.03
end
as �λ�� from employees where job_id in('PU_MAN', 'ST_CLERK', 'FI_MGR');
-- CASE ���� if ~ else if ���� ����.
-- ������ ���� ó���� �� �ִ�.
-- CASE WHEN ����1 THEN ���1
--      WHEN ����2 THEN ���2
--      WHEN ����3 THEN ���3
-- ���� : ',' ����


select * from stu_score;

insert into stu_score values
('s0006', 'ȫ����', 99, 88, 80 , 99+88+80, (99+88+80)/3, 0, sysdate, sysdate);

commit;

-- CASE ���� �� �����ڵ� ó���� �� �ִ�.
select stu_num, stu_name, stu_total, stu_avg,
case
when stu_avg >= 90 then 'A'
when stu_avg >= 80 and stu_avg < 90 then 'B'
when stu_avg >= 70 and stu_avg < 80 then 'C'
when stu_avg > 70 then 'D'
end as stu_hak from stu_score;
