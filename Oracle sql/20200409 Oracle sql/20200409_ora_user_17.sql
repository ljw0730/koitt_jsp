create table member2 (
id varchar(20) primary key,
pw varchar(20),
name varchar(20),
hobby1 number(1,0), -- 수영
hobby2 number(1,0), -- 독서
hobby3 number(1,0), -- 조깅
hobby4 number(1,0), -- 요리
gender number(1,0), -- 1: 남자, 0: 여자
address varchar(20));

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('naver', '1111', '네이버', 1, 1, 1, 1, 1, '경기도 분당');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('daum', '2222', '다음', 1, 0, 1, 0, 0, '제주도 제주시');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('google', '333', '구글', 1, 0, 0, 0, 1, '미국');

insert into member2 values
('nate', '4444', '네이트', 1, 1, 0, 0, 0, '서울시');
-- 값을 모든 칼럼에 넣을 경우 (id,pw,~~)는 입력하지 않아도 된다.

insert into member2 values
('youtube','','유튜브','','','','',0, '미국');
-- 값을 넣을때 null이나 빈공백을 넣는 것은 좋지 않다.
-- 차라리 0이라도 넣는 것이 좋다.

select * from member2;

commit;

delete from member2 where id='youtube';
-- delete from member2; => 데이터 전부 지우기

select * from member2;

rollback;
-- 실행을 되돌린다.
select * from member2;

delete from member2 where id='youtube';
-- delete from member2; => 데이터 전부 지우기
select * from member2;

insert into member2 values
('youtube', '5555', '유튜브', 1, 0, 0, 0, 0, '미국');

select * from member2;


