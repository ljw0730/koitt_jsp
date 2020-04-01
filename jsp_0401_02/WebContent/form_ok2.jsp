

<%@page import="java.util.Arrays"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 연습 - 회원가입 정보</title>
		<style type="text/css">
			table {
				border-collapse: collapse;
				border: 1px solid black;
				font-size: 15px;
			}
			tr, th, td {
				border: 1px solid black;				
			}
			th, td {
				width: 300px; height: 25px;
			}
			
			
		</style>
		<% request.setCharacterEncoding("UTF-8"); %>
	</head>
	<body>
		<h3>회원가입 정보</h3>
		<table id="join_info">
			<tr>
				<th>이름</th>
				<td><%= request.getParameter("name") %></td>
			</tr>
			<tr>
				<th>아아디</th>
				<td><%= request.getParameter("id") %></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%= request.getParameter("pw") %></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><%= Arrays.toString(request.getParameterValues("hobby")) %></td>
				
			</tr>
			<tr>
				<th>전공</th>
				<td><%= request.getParameter("major") %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= request.getParameter("address") %></td>
			</tr>
		</table>
	</body>
</html>