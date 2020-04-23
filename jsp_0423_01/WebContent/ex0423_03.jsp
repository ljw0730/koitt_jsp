<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - EL 태그, 내장 객체</title>
	</head>
	<body>
		<form action="ex0423_03_ok.jsp" name="ex0323_03" method="post">
			이름 <input type="text" name="name"><br/>
			아이디 <input type="text" name="id"><br/>
			패스워드 <input type="password" name="pw"><br/>
			
			<input type="submit" value="전송" />
		</form>
		
		<%
			// 서버 종료 될때 까지 유지
			application.setAttribute("appUser_id", "app_admin");
		
			// 세션이 종료 될때 까지 유지
			session.setAttribute("sessUser_id", "sess_admin");
			
			// 현페이지 내에서 유지(다른 페이지가 넘어가면 사라짐)
			pageContext.setAttribute("pageUser_id", "page_admin");
			
			// 다른페이지로 넘어가면 사라짐
			request.setAttribute("reqUser_id", "req_admin");
		
		
		
		%>
	</body>
</html>