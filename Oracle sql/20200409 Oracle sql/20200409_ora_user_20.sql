-- �ڰ����� �ִ� ������Դ� ������ 50������ �����ּ���.

create table job_mem2 (
id varchar2(20) primary key,
name varchar2(20),
salary number(5),
comm number(3),
phone varchar2(20),
address varchar2(50));

insert into job_mem2 values
('a001', 'ȫ�浿', 400, 1, '010-1111-1111', '����');

insert into job_mem2 values
('a002', '������', 450, '', '010-2222-2222', '���');

insert into job_mem2 values
('a003', '������', 350, '', '010-3333-3333', '��õ');

insert into job_mem2 values
('a004', '������', 550, 1, '010-4444-4444', '�λ�');

insert into job_mem2 values
('a005', '�豸', 250, '', '010-5555-5555', '����');

commit;

select * from job_mem2;

select name, salary*10000, (salary*10000)+(comm*500000) from job_mem2;
-- �ڰ����� �ִ� ����� ���޿� 50������ �߰��ؼ� �����Ѵٰ� ����.
-- null ���� �� ������ null�� ������ ������ ������ �ȳ����� �ȴ�.
select name, salary*10000, (salary*10000)+(nvl(comm,0)*500000) from job_mem2;