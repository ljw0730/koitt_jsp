<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - response.sendRedirect()</title>
	</head>
	<body>
		<%
			String age = request.getParameter("age");
			int age1 = Integer.parseInt(age);
			
			if(age1 >= 20) {
				// 페이지를 이동할때 이름은 age로 값은 age1으로 파라미터를 같이 넘긴다.
				response.sendRedirect("pass.jsp?age=" + age1);
			}
			else {
				response.sendRedirect("error.jsp?age=" + age1);
			}
			
		%>
		








		
	</body>
</html>