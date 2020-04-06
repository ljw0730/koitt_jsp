<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - jsp:param 파라미터 보내기</title>
	</head>
	<body>
		<% String name = URLEncoder.encode("홍길동", "UTF-8"); %>
		<jsp:forward page="ex0406_05_param.jsp">
			<jsp:param name="id" value="admin"/>
			<jsp:param name="pw" value="1234"/>
			<jsp:param name="name" value="<%= name %>"/>
		
		</jsp:forward>
	</body>
</html>