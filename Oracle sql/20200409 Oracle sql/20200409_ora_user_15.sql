create table member2 (
id varchar(20) primary key,
pw varchar(20),
name varchar(20),
hobby1 number(1,0),
hobby2 number(1,0),
hobby3 number(1,0),
hobby4 number(1,0),
gender number(1,0),
address varchar(20));

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('aaa', '1234', '홍길동', 1, 0, 1, 0, 0, '서울');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('bbb', '5678', '김태연', 1, 1, 1, 1, 1, '경기');

insert into member2(id, pw, name, hobby1, hobby2, hobby3, hobby4, gender, address) values
('ccc', '9012', '박보검', 0, 1, 0, 1, 0, '인천');

select * from member2;

commit;