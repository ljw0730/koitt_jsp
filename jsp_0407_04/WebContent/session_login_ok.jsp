<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 연습 (NAVER - 아이디 체크)</title>
	</head>
	<body>
		
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
		//	out.println(id);
		//	out.println(pw);
			
			if(id.equals("admin") && pw.equals("1234")) {
				session.setAttribute("auth_User", "admin");
				session.setAttribute("nick_name", "GoldStar");
				response.sendRedirect("session_index.jsp");
			
				/* String session_n;
				String session_v;
				Enumeration enum01 = session.getAttributeNames();
				while(enum01.hasMoreElements()) {
					session_n = enum01.nextElement().toString();
					session_v = session.getAttribute(session_n).toString();
					
					out.println("세션 : name - " + session_n + " / ");
					out.println("value - " + session_v + "<br/>");
				} */
			}
			else {
		%>
			<script type="text/javascript">
				alert("아이디와 비밀번호가 일치하지 않습니다.");
			</script>	
		<%	
				response.sendRedirect("session_login.html");
		    }
		%>
	</body>
</html>