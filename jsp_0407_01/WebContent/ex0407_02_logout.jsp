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
			Cookie[] cook_ch = request.getCookies();
		
			for(int i = 0; i < cook_ch.length; i++) {
				String check = cook_ch[i].getName();
				if(check.equals("naver_user")) {
					cook_ch[i].setMaxAge(0);
					response.addCookie(cook_ch[i]);
				}
				if(check.equals("nick_name")) {
					cook_ch[i].setMaxAge(0);
					response.addCookie(cook_ch[i]);
				}
			}
			
			response.sendRedirect("ex0407_02_naver_index01.jsp");
		
		%>
		
		
	</body>	
</html>