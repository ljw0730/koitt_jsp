<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>기본객체 request로 값 받기</title>
	</head>
	<body>
		
		<h2>변수 출력하기</h2>
		
		<%
			String user_id = (String)request.getAttribute("user_id");
			String user_pw = (String)request.getAttribute("user_pw");
			String user_name = (String)request.getAttribute("user_name");
		%>
		
		아이디 : <%= user_id %><br/>
		패스워드 : <%= user_pw %><br/>
		이름 : <%= user_name %><br/>
		
		<p> --------------------------------------- </p>
		
		
		아이디 : ${requestScope.user_id }<br/>
		패스워드 : ${requestScope.user_pw }<br/>
		이름 : ${requestScope.user_name }<br/>
		
		<p> ======================================== </p>
		
		<h2>class 1개 출력</h2>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>패스워드</th>
			</tr>
			<tr>
				<td>${requestScope.ldto.getNum() }</td>
				<td>${requestScope.ldto.getId() }</td>
				<td>${requestScope.ldto.getPw() }</td>
			</tr>
			
		</table>
		
		<p> ======================================== </p>
		
		<h2>ArrayList 출력</h2>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>패스워드</th>
			</tr>
			<c:forEach var="dto" items="${test }">
			<tr>
				<td>${dto.num }</td>
				<td>${dto.id }</td>
				<td>${dto.pw }</td>
			</tr>
			
			</c:forEach>		
		</table>
	</body>
</html>