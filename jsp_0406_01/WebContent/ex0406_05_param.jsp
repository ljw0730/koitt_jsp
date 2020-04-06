<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JSP - jsp:param 파라미터 받기</title>
	<style type="text/css">
		table {
			width: 600px;
			border-collapse: collapse;
		}
		tr, th, td {
			border: 1px solid black;
		}
		th {
			width: 400px;
		}
		td { 
			width: 200px;
		}
	
	</style>
	
	</head>
		<body>
			<% 
				String name = URLDecoder.decode(request.getParameter("name"));
			%>
			<table>
				<tr>
					<th>아이디</th>
					<td><%= request.getParameter("id") %></td>
					
				</tr>
				<tr>
					<th>패스워드</th>
					<td><%= request.getParameter("pw") %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%= name %></td>
				</tr>
			</table>
			
			
		</body>
</html>