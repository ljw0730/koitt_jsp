<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 전부 삭제하기</title>
	</head>
	<body>
		<%
			// 쿠키 읽어오기
			Cookie[] cookies = request.getCookies();
			if (cookies != null){
				for(int i = 0; i < cookies.length; i++) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		
			
			// 쿠키 읽어오기
			Cookie[] cookies_read = request.getCookies();
			
			if(cookies_read != null) {
				for(int i = 0; i < cookies_read.length; i++) {
					out.println("쿠키 name : " + cookies_read[i].getName() + "<br/>");
					out.println("쿠키 value : " + cookies_read[i].getValue() + "<br/>");
					out.println("-----------------------------------------------------<br/>");
				}
			}
			else {
				out.println("쿠키 정보가 없습니다.");
			}
		
		%>
	</body>
</html>