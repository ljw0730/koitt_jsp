<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 없는 경우 복잡하게 나온다. --%>
<%@ page errorPage="ex0408_02_error_404.jsp" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 예외 처리</title>
	</head>
	<body>
		<p>에러페이지</p>
		<a href="aaa.html">링크가 없는 페이지 연결</a>
	</body>
</html>