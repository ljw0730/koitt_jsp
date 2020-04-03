<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP - 관리자 로그완료 창</title>
</head>
<body>
	
	<h2><%= request.getParameter("name") %> 님 환영합니다.</h2>
	<h2> 로그인 되셨습니다.</h2>

	<p>
		관리자 id = <%= request.getParameter("id") %>
	</p>
	<p>
		관리자 pw = <%= request.getParameter("pw") %>
	</p>

</body>
</html>