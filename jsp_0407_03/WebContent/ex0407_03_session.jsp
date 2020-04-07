<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session</title>
	</head>
	<body>
		
		<%
			//쿠키 생성
			Cookie co1 = new Cookie("id", "admin");
		
			//세션 생성
			session.setAttribute("auth_User", "admin");
			session.setAttribute("naver_id", "admin");
			session.setAttribute("pw", 1234);
			session.setAttribute("nick_name", "goldstar");
		
		%>
		
		<h2>세션이 저장 되었습니다.</h2>
		<a href="ex0407_03_sesstion_get.jsp">세션 보기</a>
	</body>
</html>