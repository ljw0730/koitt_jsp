<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 정보 읽기</title>
	</head>
	<body>
		<%
			String session_n;
			String session_v;
			
			Enumeration enum01 = session.getAttributeNames();
			while(enum01.hasMoreElements()) {
				session_n = enum01.nextElement().toString();
				session_v = session.getAttribute(session_n).toString();
				
				out.println("세션 : name - " + session_n + " / ");
				out.println("value - " + session_v + "<br/>");
			}
		
			out.println("---------------------------------------------------------<br/>");
			
			String sessionId = session.getId();
			out.println("세션 고유번호 : " + sessionId + "<br/>");
			
			out.println("---------------------------------------------------------<br/>");
			
			int session_t = session.getMaxInactiveInterval();
			out.println("세션 유효시간 : " + session_t + "<br/>");
			
		%>
		
		<form action="ex0407_04_form04.jsp" name="del_form" method="get">
			<label for="del_name"></label>
			<input type="text" name="del_name" id="del_name" /><br/>
			
			<input type="submit" value="해당 세션 지우기">
		
		</form>
	</body>
</html>