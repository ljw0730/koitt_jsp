<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		    
			String uri = request.getRequestURI();
			// uri = /jsp_0424_01/ex0424_06.jsp
		
			String conPath = request.getContextPath();
			// ContextPath = /jsp_0424_01
			
			String com = uri.substring(conPath.length());
			// com = /ex0424_06.jsp
			
			
			String str = "abcdefg";
			String result = str.substring(4);
			
		
		%>
	</body>
</html>