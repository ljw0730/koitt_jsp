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
			Cookie[] cook_all = request.getCookies();
		
			for(int i = 0; i < cook_all.length; i++) {
				out.println(cook_all[i].getName() + "<br/>");
				out.println(cook_all[i].getValue() + "<br/>");
			}
		
		
		%>
	</body>
</html>