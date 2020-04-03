<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - request.getParameter</title>
	</head>
	<body>
		<%
			// 한글 처리
			request.setCharacterEncoding("UTF-8");
		
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String[] hobby = request.getParameterValues("hobby");
			String major = request.getParameter("major");
			String address = request.getParameter("address");
		%>
		<table>
			<tr>
				<th>이름</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th>아아디</th>
				<td><%= id %></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%= pw %></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><%= Arrays.toString(hobby) %></td>
			</tr>
			<tr>
				<th>전공</th>
				<td><%= major %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= address %></td>
			</tr>
		</table>

		<%	
			// Enumeration은 Iterator의 구버전
			Enumeration enumeration = request.getParameterNames();
			// 현재 읽어올 name이 있는지 확인
			int i = 1;
			while(enumeration.hasMoreElements()) {
				String enum_Name = enumeration.nextElement().toString();
				out.println("form의 " + i + "번째 변수 이름 : " + enum_Name + "<br/>");
				i++;
			}
		
		%>








		
	</body>
</html>