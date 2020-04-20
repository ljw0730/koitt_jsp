-- ��¥ �Լ�

select sysdate from dual;
-- �ý��ۿ��� ���� ��¥ �� �ð��� �����´�.

select sysdate, sysdate+365 as validity from dual;
-- ���� ��¥�� 1������ ��¥�� ���Ѵ�.
-- �ַ� 1���Ŀ� ȸ������? ������ ������ ���� ����Ѵ�.

select hire_date, round(sysdate-hire_date) from employees;
-- ���� ��¥�� ���� ����� ���� ������ �ٹ� �ϼ��� �� �� �ִ�.
-- /365�� ������ ������ �� �� �ִ�.
-- /365*12 �ϸ� �޼��� �� �� �ִ�.
-- round(a, b) b �ȿ� �ƹ��͵� �ȳ����� �Ҽ��� ù°�ڸ����� �ݿø��Ѵ�.

select hire_date, round(months_between(sysdate, hire_date))
from employees;
-- months_between �Ѽ��� ���� �޼��� �� �� �ִ�.
-- round(a, b) b �ȿ� �ƹ��͵� �ȳ����� �Ҽ��� ù°�ڸ����� �ݿø��Ѵ�.

select hire_date, add_months(sysdate, 3)
from employees;
-- add_months(sysdate, n) n ���� ���� ��¥�� �����ش�.
-- -(���̳ʽ�) ���� �Է��ϸ� n ���� ���� ��¥�� �����ش�.

select sysdate ,next_day(sysdate, '�����') from dual;
-- ���ƿ��� ����Ͽ� ��¥�� �����ش�.
-- �Ͽ����� ������ �����̴�.

select sysdate, last_day(sysdate) from dual;
-- ���� ���� ������ ��¥�� �����ش�.
