rename m0420_1 to m0421_1;
-- 테이블 이름을 변경한다.

alter table m0421_1 add(id varchar2(20));
-- id varchar2(20) 추가하기

select * from m0421_1;


alter table m0421_1 modify(id varchar2(30));
-- 타입변경하기 