<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - NAVER 로그아웃(session 삭제)</title>
	</head>
	<body>
	
	<%
		session.invalidate();
	
		response.sendRedirect("session_index.jsp");
	%>
	
	
	</body>
</html>