<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="ex0408_02_error_500.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 예외 처리</title>
	</head>
	<body>
		<p>메인사이트를 제작한 페이지 입니다.</p>
		<%
			int i = 40/0;
		
		%>
	</body>
</html>