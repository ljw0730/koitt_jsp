<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 생성</title>
	</head>
	<body>
		<%
			String name1 = request.getParameter("name1");
			String value1 = request.getParameter("value1");
			String name2 = request.getParameter("name2");
			String value2 = request.getParameter("value2");
			
			session.setAttribute(name1, value1);
			session.setAttribute(name2, value2);
		
		%>
		<h2>세션이 생성 되었습니다.</h2>
		<a href="ex0407_04_form03.jsp">세션보기</a>	
	
	</body>
</html>