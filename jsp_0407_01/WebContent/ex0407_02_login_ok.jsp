<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 연습 (NAVER - 아이디 체크)</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// db로 이동해서 id,pw를 체크하게 됨. 결과 값을 리턴
			if(id.equals("admin") && pw.equals("1234")) {
				Cookie co1 = new Cookie("naver_user", "admin");
				co1.setMaxAge(1800); // 60 * 30 -> 30분
				response.addCookie(co1);
				
				Cookie co2 = new Cookie("nick_name", "GoldStar");
				co2.setMaxAge(1800); // 60 * 30 -> 30분
				response.addCookie(co2);
				
				response.sendRedirect("ex0407_02_naver_index02.jsp");
			}
			else {
			%>
				<script>alert("아이디/패스워드가 일치하지 않습니다.\n 다시 로그인 해주세요.");</script>
			<%
				response.sendRedirect("ex0407_02_login.html");
			}
		
		%>
	</body>
</html>