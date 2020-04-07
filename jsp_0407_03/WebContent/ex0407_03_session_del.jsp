<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 지워 졌는지 확인 / session 전체 지우기</title>
	</head>
	<body>
		<%
			String auth_User = (String)session.getAttribute("auth_User");
			if(auth_User == null) {
				out.println("auth_User 섹션이 없습니다.<br/>");
			}
			else {
				out.println(auth_User + "가 있습니다.<br/>");
			}
			
			
			// 세션 전부 지우기
			session.invalidate();
			
		%>
		
		<a href="ex0407_03_session_alldel.jsp">세션 모두 지우기</a>
		
	</body>
</html>