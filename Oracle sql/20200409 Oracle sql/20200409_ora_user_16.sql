create table member (
id varchar(20) primary key,
pw varchar(20),
name varchar(20),
phone varchar(20));

insert into member(id, pw, name, phone) values
('abc', '123','홍길동', '010-1234-5678');

insert into member(id, pw, name, phone) values
('bcd', '123','홍길동', '010-1234-5678');
-- 프라이머리 키는 중복이 안되지만 나머지는 중복이 가능하다.

insert into member(id, pw, name, phone) values
('cde', '456','유관순', '010-2345-6789');

insert into member(id, pw, name, phone) values
('def', '789','강감찬', '010-3456-7890');

select * from member;

commit;

update member set pw='234', name='김유신',
phone='010-2222-3456'
where id='bcd';

select * from member where id='bcd';
select * from member;

insert into member(id, pw, name, phone) values
('efg', '567', '김구', '010-5555-6789');

commit;

select * from member;

update member set name='홍길동' where id='efg';

select * from member;

commit;

select * from member where name='홍길동';

select * from member where name='홍길동' and phone='010-5555-6789';
-- 이름이 홍길동 이고 전화번호가 010-5555-6789 인 사람을 찾아달라.

update member set pw='111' where name='홍길동';
-- 이렇게 하면 이름이 홍길동 인 사람의 패스워드가 전부 111로 바뀐다.
select * from member;

update member set pw='55555' where name='홍길동' and phone='010-5555-6789';
-- 이름이 홍길동 이고 전화번호가 010-5555-6789 인 사람을 찾아서
-- 비밀번호를 55555로 변경하라.
select * from member;
