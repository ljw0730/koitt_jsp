rename m0420_1 to m0421_1;
-- ���̺� �̸��� �����Ѵ�.

alter table m0421_1 add(id varchar2(20));
-- id varchar2(20) �߰��ϱ�

select * from m0421_1;


alter table m0421_1 modify(id varchar2(30));
-- Ÿ�Ժ����ϱ� 