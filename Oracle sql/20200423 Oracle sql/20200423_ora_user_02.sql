select * from employees order by employee_id asc;
select * from jobs;

-- 연봉인상을 해주는 사람을 찾아서 salary를 인상해 주세요.
-- QU_MAN -> 5% 인상
-- ST_CLERK -> 10% 인상
-- FI_MGR -> 3% 인상

select emp_name, job_id, salary,
decode(job_id,
'PU_MAN', salary*0.05,
'ST_CLERK', salary*0.10,
'FI_MGR', salary*0.03
) as 인상율,
decode(job_id,
'PU_MAN', salary*1.05,
'ST_CLERK', salary*1.10,
'FI_MGR', salary*1.03
) as 인상금액
from employees 
where job_id in('PU_MAN','ST_CLERK','FI_MGR');
