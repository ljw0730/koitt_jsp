<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 정보 보기</title>
	</head>
	<body>
	
		<%
			// 저장된 쿠키 모두 읽어오기
			// 쿠기가 몇개 있는지 알 수 없으므로 배열로 받는다.
			Cookie[] co_all = request.getCookies();
			
			for(int i = 0; i < co_all.length; i++) {
				String c_name = co_all[i].getName();
				
				if(c_name.equals("authUser")) {
					out.println("name :" + c_name + "<br/>");
					out.println("아이디 : " + co_all[i].getValue() + " 님 안녕하세요.<br/>");
					// 실제 기본적인 모습으로 로그인이 제대로 되어 있으니 메인페이저로 보냄.
				//	response.sendRedirect("main.jsp");
				}
				//else {
					// 실제 기본적인 모습으로 로그인이 제대로 되어 있지 않으므로 로그인페이지로 보냄.
				//	response.sendRedirect("login.html");
				//}
			}
		
		%>
		
		<p>-------------------------------------------------------------------------</p>
	
		<%
			for(int i=0; i < co_all.length; i++) {
				out.println((i+1) + "번째 Cookie 정보 : " + co_all[i].getName() + " / ");
				out.println(co_all[i].getValue() +"<br/>");
			}
		
		%>
	
		<a href="ex0407_01_cookie_del.jsp">쿠키 정보 지우기</a>
	
	</body>
</html>