<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 출력</title>
	</head>
	<body>
		<p>HelloWorld</p>
		<%
			int sum = 0;	
			for(int i = 1; i <= 100; i++) {
				sum += i;
				out.println(i + " 번째 숫자 " + i + " 까지의 합 : "+ sum + "<br/>");
			}
		
		%>
	</body>
</html>