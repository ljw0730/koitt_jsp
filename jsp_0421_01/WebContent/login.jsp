<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("auth_user") != null) {
%>
		<jsp:forward page="main.jsp" />
<%
	}
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - 회원관리 프로그램(로그인화면)</title>
		<script type="text/javascript" src="js/custom.js" ></script>
	</head>
	<body>
		<form action="login_ok.jsp" name="login_form" method="post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /> <br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" /> <br/>
			
			<input type="button" value="로그인" onclick="login_check();" />
			<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'" />
		
		</form>
	</body>
</html>