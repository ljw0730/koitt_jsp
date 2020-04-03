<%@page import="java.net.URLEncoder"%>
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
			// 만약 한글이 깨진다면 아래와 같이 한다.
			// String name = URLEncoder.encode(request.getParameter("name"), "UTF-8");
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if((id.equals("admin") && pw.equals("777"))) {
				response.sendRedirect("login_ok.jsp?name=" + name
										+ "&id=" + id + "&pw=" + pw);
			}
			else {
				response.sendRedirect("login.jsp?id="+id);
			}
		
		%>

		
	</body>
</html>