select * from employees order by employee_id asc;
select * from jobs;

-- �����λ��� ���ִ� ����� ã�Ƽ� salary�� �λ��� �ּ���.
-- QU_MAN -> 5% �λ�
-- ST_CLERK -> 10% �λ�
-- FI_MGR -> 3% �λ�

select emp_name, job_id, salary,
decode(job_id,
'PU_MAN', salary*0.05,
'ST_CLERK', salary*0.10,
'FI_MGR', salary*0.03
) as �λ���,
decode(job_id,
'PU_MAN', salary*1.05,
'ST_CLERK', salary*1.10,
'FI_MGR', salary*1.03
) as �λ�ݾ�
from employees 
where job_id in('PU_MAN','ST_CLERK','FI_MGR');
