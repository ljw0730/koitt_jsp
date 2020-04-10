select * from employees where hire_date < '07/01/01' order by hire_date asc;
-- 날짜도 비교가 가능하다.

--2가지 조건 한번에 쓰기
select * from employees where salary>5000 and department_id=50;
-- 월급이 5000이상이면서 부서아이디가 50인 사람

select count(*) from employees where salary>5000 and department_id=50;
-- 월급이 5000이상이면서 부서아이디가 50인 사람의 수

-- 월급이 4000이상이면서 부서아디이가 30인 사람
select * from employees where salary>=4000 and department_id=30;

-- 월급이 3000, 4000, 5000, 6000, 10000 인 사람
select * from employees where
salary=3000 or
salary=4000 or
salary=5000 or
salary=6000 or
salary=10000 order by salary asc;

-- 사원번호가 104번이거나 150번 이상인 사람을 검색
select * from employees where
employee_id=104 or employee_id>150
order by employee_id asc;

-- 사원번호가 150~160 인 사람
select * from employees where
employee_id between 150 and 160;
-- between A and B : A 와 B 사이
-- and와 같다.

-- 월급이 5000보다 작거나 10000보다 큰 사람
select * from employees where
salary < 5000 or salary>10000;

select * from employees where
salary not between 5000 and 10000;
-- not between A and B : A 와 B 사이를 제외한
-- or 와 같다.

select * from employees where
hire_date between '00/01/01' and '05/12/31'
order by hire_date asc;
-- 날짜도 between이 된다.

select * from employees
order by emp_name asc;
-- 이름도 정렬이 된다.(사전순서)(asc-오름차순, desc-내림차순)


select * from employees 
where salary=3000 or salary=4000 or salary=5000;

select * from employees
where salary in(3000, 4000, 5000);
-- in(A,B,C,D...) : A 이거나 B 이거나 C 이거나 D 이거나...
-- A or B or C or D or ... 와 같다.

-- 부서번호가 30, 40 , 50 이면서 월급이 5000이상인 사람
select * from employees
where department_id in(30, 40 , 50) and salary>=5000;

--
select * from employees where commission_pct is null;
-- is null : 칼럼 안에 null 인
-- commission_pct = null 으로는 안되다.

