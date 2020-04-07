<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<%
		Cookie[] co_all = request.getCookies();
	
		// 로그아웃을 눌렀다고 치자.
		
		for(int i = 0; i < co_all.length; i++) {
			String c_name = co_all[i].getName();
			
			if(c_name.equals("authUser")) {
				// 쿠키 삭제
				co_all[i].setMaxAge(0);
				response.addCookie(co_all[i]);
			}
			if(c_name.equals("nick_name")) {
				// 쿠키 삭제
				co_all[i].setMaxAge(0);
				response.addCookie(co_all[i]);
			}
			if(c_name.equals("user_id")) {
				// 쿠키 삭제
				co_all[i].setMaxAge(0);
				response.addCookie(co_all[i]);
			}
		}
		// 실제 기본적인 모습으로 로그 아웃됬으므로 로그인 페이지로 보냄
		//response.sendRedirect("login.html");
	%>
	
	<h2>쿠키가 삭제 되었습니다.</h2>
	<a href="ex0407_01_cookie_get.jsp">쿠키 정보 보기</a>	
	
	</body>
</html>