<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 로그인/회원정보입력/회원정보수정 연습 - 로그인 화면</title>
	</head>
	<body>
		
		<form action="Login_Ok" name="login" method="post">
			<h2>관리자 로그인</h2>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /><br/>
			<label for= "pw">패스워드</label>
			<input type="password" name="pw" id="pw" /><br/>
			
			<input type="submit" value="로그인" />
	
		</form>
		
	</body>
</html>