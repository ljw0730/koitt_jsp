select * from employees where emp_name='Pat Fay';
-- 이름 검색할 때 대소문자 구분을 한다.



-- 이름이 p로 시작하는 사람을 출력해보세요.
select * from employees where emp_name like 'P%';
-- like 'P%' : P로 시작하는...

-- 이름에 P가 있는 사람을 출력해보세요.
select * from employees where emp_name like '%P%';

-- 이름에 두번째 자리에 o 가 있는 사람을 출력해보세요.
select * from employees where emp_name like '_o%';
-- _ 를 추가함으로 써 몇번째 자리에 o가 있는 사람을 찾을 수 있다.