select * from employees;

select salary*1300, salary*commission_pct*1300 from employees;

select (salary*1300)+(salary*commission_pct*1300) from employees;
-- commission_pct�� null���� �� �ִ� ���� �ִ�.
-- null�� ���Ѵ� �̱� ������ ���ϰų� ���ϱ⸦ �ص� null�̴�.
select salary*1300, (salary*1300)+(salary*1300*nvl(commission_pct,0)) from employees;
-- nvl(commition_pct,0) => commition_pct�� null�� ������ ���� 0���� ����� �޶�.

-- 