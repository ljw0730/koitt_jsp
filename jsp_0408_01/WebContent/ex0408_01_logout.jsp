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
			// 지정 삭제
			session.removeAttribute("auth_User");
			
			// 전체삭제
			session.invalidate();
			
			response.sendRedirect("ex0408_01_index.jsp");
		
		%>
	</body>
</html>