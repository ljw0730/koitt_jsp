<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 스크립트릿</title>
	</head>
	<body>
		
		<!-- html 주석 - html 소스보기에서는 나타난다. -->
		<%-- jsp 주석 : html 소스보기에서 나타난다. --%>
	
		<%
			int i = 0;
			out.println("<구구단 2단 출력><br/>");
			while(true) {
				i++;
				out.println("2 * " + i + " = " + (2*i) + "<br/>");
			
		%>
	
	    <p> ================ </p>
	
		<%
				if(i >= 9) {
					break;
				}
			}
		%>
	
	</body>
</html>