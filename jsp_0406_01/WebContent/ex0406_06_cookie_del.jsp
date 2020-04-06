<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 삭제</title>
	</head>
	<body>
	
		<h2>naver 페이지에서 로그아웃을 하였습니다.</h2>
	
		<%
			Cookie[] cookies = request.getCookies();
			for(int i = 0; i < cookies.length; i++) {
				String str = cookies[i].getName();
				
				if(str.equals("naver_id")) {
					out.println("naver_id 쿠키 삭제" + "<br/>");
					// 0 초 -> 쿠키 삭제
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		%>

		<a href="ex0406_06_cookie_test.jsp">쿠키 확인</a>
		
	</body>
</html>