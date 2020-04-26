<%@page import="com.javalec.ex.Bcon.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	ArrayList list = new ArrayList();
	
	LoginDTO log = null;
	for(int i = 0; i < 5; i++) {
		log = new LoginDTO();
		log.setNum(i+1);
		log.setId("admin" + i);
		log.setPw("abc"+i);
		list.add(log);
	}
	
	request.setAttribute("test", list);
	
	
	
	// 어제까지만 해도 리스트에 값을 담을때는 아래와 같이 했었다.
	// ArrayList list2 = new ArrayList();
	// MemberDao mdao = MemberDao.getInstance();
	// list = mado.getMembers();

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core - forEach</title>
		<style type="text/css">
			table {
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
			
			table tr, th, td {
				border: 1px solid black;
			}
						
		</style>
	</head>
	<body>
		<h2>ArrayList를 이용하여 forEach-items</h2>
		
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