<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("ch_id");

	MemberDAO mdao = MemberDAO.getInstance();
	int check = mdao.id_check(id);
	// check == 1 -> 아이디 중복O
	// check == 0 -> 아이디 중복X. 사용가능
%>
	<script>
		location.href="id_overlap_check.jsp?id=<%= id %>&check=<%= check %>";
	</script>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복 체크</title>
		<script type="text/javascript" src="js/custom.js"></script>
	</head>
	<body>
				
	</body>
</html>