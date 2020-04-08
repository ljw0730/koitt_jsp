<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="join1" class="com.javalec.ex.Join" scope="page"/>
<jsp:setProperty name="join1" property="*" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - bean - form으로부터 온 데이터 받기/출력</title>
		<style type="text/css">
			table {
				width: 600px;
				font-size: 20px;
				border-collapse: collapse;
			}
			tr, th, td {
				border: 1px solid black;
			}
			th {
				width:200px; height: 20px;
			}
			td {
				width: 400px;
			}
		</style>
	</head>
	<body>
		<h2>회 원 정 보</h2>
		<table>
			<tr>
				<th>이름</th>
				<td><%= join1.getName() %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%= join1.getId() %></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%= join1.getPw1() %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%= join1.getGender() %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= join1.getAddress() %></td>
			</tr>
		</table>
	</body>
</html>