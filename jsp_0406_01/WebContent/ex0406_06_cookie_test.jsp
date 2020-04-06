<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 삭제 확인</title>
	</head>
	<body>
		<h2>[남아 잇는 쿠키 정보]</h2>
		<%
			
			Cookie[] cookies = request.getCookies();
		
			if(cookies != null) {
				for(int i = 0; i < cookies.length; i++) {
					out.println("-----------------------------------------<br/>");
					out.println("쿠키 name : " + cookies[i].getName() + "<br/>");
					out.println("쿠키 value : " + cookies[i].getValue() + "<br/>");
				}
			}
		
		%>
		
	</body>
</html>