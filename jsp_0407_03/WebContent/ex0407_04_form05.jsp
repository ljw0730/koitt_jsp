<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>JSP - 세션 전부 지워졌는지 확인</title>
		</head>
	<body>
		
		<%
			// 세션 전부 지우기
			session.invalidate();
		
			if(request.isRequestedSessionIdValid()) {
				out.println("세션이 아직 남아 있습니다.");
				
				String session_n;
				String session_v;
				
				Enumeration enum01 = session.getAttributeNames();
				while(enum01.hasMoreElements()) {
					session_n = enum01.nextElement().toString();
					session_v = session.getAttribute(session_n).toString();
					
					out.println("세션 : name - " + session_n + " / ");
					out.println("value - " + session_v + "<br/>");
				}
				
			}
			else {
				out.println("세션이 전부 지워졌습니다.");
			}
		
		%>
	
	</body>
</html>