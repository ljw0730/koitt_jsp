<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 성인인증 - 미성년</title>
	</head>
	<body>
	
		<h2>주류 및 담배를 구매 불가능합니다.</h2>
		<p>당신의 나이는 <%= request.getParameter("age") %>세 입니다.</p>
		<p>미성년입니다.</p>
	
	</body>
</html>