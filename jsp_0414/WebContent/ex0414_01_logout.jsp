<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 회원가입 연습 (로그아웃)</title>
	</head>
	<body>
		<%
			session.invalidate();
			response.sendRedirect("ex0414_01_index.jsp");		
		%>
	</body>
</html>