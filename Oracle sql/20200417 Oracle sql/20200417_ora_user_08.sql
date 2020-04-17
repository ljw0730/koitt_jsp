-- 시퀀스 생성
create sequence m3_seq
increment by 1
start with 1
minvalue 1
maxvalue 10000
nocycle;

create table member3 (
m_num number(5),
id varchar2(20) primary key,
pw varchar2(20) not null,
name varchar2(20) not null,
eamil varchar2(20),
address varchar2(50),
phone varchar2(13),
birth date,
gender varchar2(10) check(gender in('남성', '여성')),
news varchar2(15) check(news in('예', '아니오')),
sms varchar2(15) check(sms in('예', '아니오')),
join_date date default sysdate);

insert into member3(m_num, id, pw, name, email, address, phone, birth, gender, news, sms) values
(m3_seq.nextval, 'aaa', '111', '홍길동', 'aaa@naver.com', '서울', '010-1111-1111', '89/11/11', '남성', '예', '예');

insert into member3(m_num, id, pw, name, email, address, phone, birth, gender, news, sms) values
(m3_seq.nextval, 'bbb', '222', '유관순', 'bbb@gmail.com', '경기', '010-2222-2222', '02/03/24', '여성', '아니오', '예');

select * from member3;

commit;