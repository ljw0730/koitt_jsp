<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 보기 연습</title>
		<!-- ex0406_01_html.html 과 연결되어 있음 -->
	</head>
	<body>
		
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String[] hobby = request.getParameterValues("hobby");
			String gender = request.getParameter("gender");
			
			Enumeration enumeration = request.getParameterNames();
		%>
	
		<h1>회원정보 </h1>
		<p>아이디 : <%= id %></p>
		<p>패스워드 : <%= pw %></p>
		<p>이름 : <%= name %></p>
		<p>취미 : <%= Arrays.toString(hobby) %>
		<p>성별 : <%= gender %></p>
		========================================<br/>
		<%
			while(enumeration.hasMoreElements()) {
				String e_name = enumeration.nextElement().toString();
				out.println(e_name);
			}
		%>
	
	</body>
</html>