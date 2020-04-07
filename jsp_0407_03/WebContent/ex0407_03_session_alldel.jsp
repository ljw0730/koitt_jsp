<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 전부 지워 졌는지 확인</title>
	</head>
	<body>
		
		<%
			// session에 유효한 값이 있는 지 확인
			if(request.isRequestedSessionIdValid()) {
				out.println("세션이 있습니다.");
			}
			else {
				out.println("세션이 없습니다.");
			}
		
		
		%>
		
	</body>
</html>