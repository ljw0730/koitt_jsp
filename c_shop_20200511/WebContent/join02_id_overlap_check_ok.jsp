<%@page import="com.javalec.ex.DAO.Join_BDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("ch_id");

	Join_BDAO jbdao = Join_BDAO.getInstance();
	int check = jbdao.id_check(id);
	// check == 1 -> 아이디 중복
	// check == 0 -> 아이디 중복x. 사용가능

	response.sendRedirect("join02_id_overlap_check.jsp?id="+id+"&check="+check);
	
	
%>
	<!-- 
	<script>
		location.href="join02_id_overlap_check.jsp?id=<%= id %>&check=<%= check %>";
	</script>
	 -->

<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복 체크</title>
	</head>
	<body>
	
	</body>
</html>