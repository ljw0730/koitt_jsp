<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - 회원관리 프로그램(회원가입화면)</title>
		<script type="text/javascript" src="js/custom.js" ></script>
	</head>
	<body>
		<h2> 회 원 가 입 </h2>
		<form action="join_ok.jsp" name="join_form" method="post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /> <br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" /> <br/>
			<label for="pw_check">패스워드 체크</label>
			<input type="password" name="pw_check" id="pw_check" /> <br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" /> <br/>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" /> <br/>
			<label for="address">주소</label>
			<input type="text" name="address" id="address" /> <br/>
			
			<input type="button" onclick="join_check()" value="회원가입완료" />
			<input type="button" onclick="javascript:location.href='login.jsp'" value="취소" />
			
		
		
		</form>
	</body>
</html>