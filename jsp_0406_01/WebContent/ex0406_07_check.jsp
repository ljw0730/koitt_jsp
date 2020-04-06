<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 내용 저장 및 보기 연습</title>
	</head>
	<body>
		
		<%
			// 파라미터값 받기
			String c_name = request.getParameter("c_name");
			String c_value = request.getParameter("c_value");
			
			// 쿠키 저장
			Cookie cookie = new Cookie(c_name, c_value);
			cookie.setMaxAge(60*30);
			response.addCookie(cookie);
			
			// 쿠키 읽어오기
			Cookie[] cookies_read = request.getCookies();
			
			for(int i = 0; i < cookies_read.length; i++) {
				out.println("쿠키 name : " + cookies_read[i].getName() + "<br/>");
				out.println("쿠키 value : " + cookies_read[i].getValue() + "<br/>");
				out.println("-----------------------------------------------------<br/>");
			}
			
		%>
		
		<a href="ex0406_07_del.jsp">쿠키 전체 삭제</a>
		
	</body>
</html>