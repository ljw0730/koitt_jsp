<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 시작 - html 사용과 똑같다.</title>
	</head>
	<body>
		<form action="F_ok" name="login" method="get">
			<h1>회원가입</h1>
			<ul>
				<li>
					<h3>로그인</h3>
				</li>
				<li>
					<label>아이디</label>
					<input type="text" name="id" />
				</li>
				<li>
					<label>패스워드</label>
					<input type="password" name="pw" />
				</li>
				<li>
					<input type="submit" value="전송" />
					<input type="reset" value="취소" />
				</li>
				
			</ul>
		</form>
	</body>
</html>