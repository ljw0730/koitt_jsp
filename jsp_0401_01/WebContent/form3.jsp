<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP파일로 값 보내기</title>
	</head>
	<body>
		<form action="form_ok.jsp" name="login" method="post">
			<h3>로그인 페이지</h3>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /> <br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" /> <br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" /> <br/>
			<input type="submit" value="로그인" />
			<input type="reset" value="취소" />
		
		
		</form> 
	</body>
</html>