<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 문서 만들기 연습하기</title>
	</head>
	<body>
		<form name="login" action="#" method="post">
			<h1>회원가입</h1>
			<h3>로그인</h3>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /><br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" /><br/>
			<input type="submit" value="가입하기" />
			<input type="reset" value="취소" />
		
		</form>
	</body>
</html>