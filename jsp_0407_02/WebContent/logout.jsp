<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - NAVER 로그아웃(쿠키 삭제)</title>
	</head>
	<body>
	
	<%
		// 쿠키를 모두 삭제 후 index01.jsp 로 이동
		Cookie[] cookies = request.getCookies();
	
		for(int i = 0; i < cookies.length; i++) {
			String cookie_ch = cookies[i].getName();
			if(cookie_ch.equals("auth_User")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				response.sendRedirect("naver_index01.jsp");
			}
		}
	
	
	
	%>
	
	
	</body>
</html>