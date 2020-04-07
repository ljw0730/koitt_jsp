<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 세션 1개 지우기</title>
	</head>
	<body>
		<%
			String del_name = request.getParameter("del_name");
		
			session.removeAttribute(del_name);
			
			String session_val = (String)session.getAttribute(del_name);
			if(session_val == null) {
				out.println(del_name + "세션이 지워 졌습니다.<br/>");
			}
			else {
				out.println(session_val + "가 있습니다.<br/>");
			}
			
			out.println("---------------------------------------------------------<br/>");
			
			String session_n;
			String session_v;
			
			Enumeration enum01 = session.getAttributeNames();
			while(enum01.hasMoreElements()) {
				session_n = enum01.nextElement().toString();
				session_v = session.getAttribute(session_n).toString();
				
				out.println("세션 : name - " + session_n + " / ");
				out.println("value - " + session_v + "<br/>");
			}
			
		%>
		
		<a href="ex0407_04_form05.jsp" >세션 전부 지우기</a>
		
	</body>
</html>