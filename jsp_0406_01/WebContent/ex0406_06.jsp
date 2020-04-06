<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키</title>
	</head>
	<body>
		<h2>
			쿠키 3개가 저장되었습니다. <br/>
			읽기를 클릭해 주세요.
		</h2>
		<%
			// 쿠키 입력
			Cookie cookie = new Cookie("naver_id","admin"); // 이름, 값
			cookie.setMaxAge(60*30);	// 1800초 -> 30분

			// 쿠키라는 정보를 너의 컴퓨터 어딘가에 저장해줘
			response.addCookie(cookie);		
			
			Cookie cookie2 = new Cookie("naver_pw", "1234");
			cookie2.setMaxAge(60 * 30);
			response.addCookie(cookie2);
			
			Cookie cookie3 = new Cookie("nick_name", "koitt");
			cookie3.setMaxAge(60 * 30);
			response.addCookie(cookie3);
		%>
		
		<a href="ex0406_06_cookie_get.jsp">쿠기정보 읽기</a>
		
	</body>
</html>