<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 시작</title>
		<style type="text/css">
			table{
				width: 600px;
				font-size: 20px;
				border: 1px solid black;
				border-collapse: collapse;
			}
			tr, th, td {
				border: 1px solid black;
			}
			th {
				width: 200px; height: 20px;
				text-align: center;
			}
			td {
				width: 400px; height: 20px;			
			}
		</style>
		<% request.setCharacterEncoding("UTF-8"); %>
	</head>
	<body>
		<h1>로그인 정보</h1>
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
				<td><%= request.getParameter("name") %></td>
			</tr>
		</table>
	</body>
</html>