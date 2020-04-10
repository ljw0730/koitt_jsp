create table koitt_member (
id varchar2(20) primary key,
name varchar2(20),
pay number(7),
t_day number(2));

insert into koitt_member(id, name, pay, t_day) values
('ko1', '허성무', '30000', '20');

insert into koitt_member values
('ko2', '조준희', '30000', '20');
-- 칼럼 전체에 대해 입력을 한다면 (id, name, ~~) 부분은 생략 가능하다.

insert into koitt_member values
('ko3', '홍길동', '30000', '');
-- '' 은 null로 들어 간다.
-- null 또는 빈공백은 넣지 않는 것이 좋다.

insert into koitt_member values
('ko4', '유관순', '30000', '');

commit;

select * from koitt_member;

select name, pay*nvl(t_day,0) as 이번달수당 from koitt_member;
-- nvl(t_day,0) : t_day에 null 값이 있으면 0으로 계산해 달라
-- as 이번달수당 : 칼럼이름에 별칭을 넣는다.

