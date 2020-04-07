<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 연습 (NAVER - 아이디 체크)</title>
	</head>
	<body>
		
		<%
			// id, pw를 비교해서 쿠키에 저장
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// 나중에 DB와 연동해서 id, pw를 비교
			if(id.equals("admin") && pw.equals("1234")) {
				Cookie co1 = new Cookie("auth_User", id);
				co1.setMaxAge(1800); // 60 * 30 => 30분
				response.addCookie(co1);
				response.sendRedirect("naver_index01.jsp");
			}
			else {
				response.sendRedirect("login.html");				
			}
		
		%>
		
		
	</body>
</html>