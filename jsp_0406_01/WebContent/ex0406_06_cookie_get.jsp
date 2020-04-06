<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 정보 보기</title>
	</head>
	<body>
		
		<h2>[로그인 정보]</h2>
		
		<%
			// 저장된 쿠키를 읽어오기.
			// ** 배열로 받는다.
			// 쿠키는 최대 300개까지 받기 때문에 들어온때 몇개 인지 모르므로 배열로 받는다.
			Cookie[] cookies =  request.getCookies();
		
			for(int i = 0; i < cookies.length; i++) {
				// 
				String str = cookies[i].getName();
				
				if(str.equals("naver_id")) {
					out.println("네이버 로그인이 되어 있는 상태입니다." + "<br/>");
					out.println("네이버 아이디 : " + cookies[i].getValue() + "<br/>");
					continue;
				}
				
				out.println("------------------------------------------------------<br/>");
				out.println("<h2>쿠키에 저장되어 있는 모든 정보</h2>");	
				
				out.println("쿠키 이름 : " + cookies[i].getName() + "<br/>");
				out.println("쿠키 값 : " + cookies[i].getValue() + "<br/>");
			}
		
		%>
		
		<br/>
		<a href="ex0406_06_cookie_del.jsp">쿠키 삭제</a>
		
	</body>
</html>