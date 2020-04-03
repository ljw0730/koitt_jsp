<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - html 테이블 for문 구구단</title>
		<style type="text/css">
			table {
				font-size: 20px;
				border-collapse: collapse;
			}
			tr, th, td {
				border-bottom: 1px solid black;
			}
			th {
				height: 20px; 
			}
			td {
				height: 20px;
			}
		
		</style>
	</head>
	<body>
		
		<!-- html 주석 - html 소스보기에서는 나타난다. -->
		<%-- jsp 주석 : html 소스보기에서 나타난다. --%>
		<h1>구구단 2단 출력</h1>
		<table>
			<%
				int i = 0;
				for(i = 1; i <= 9; i++) {
					out.println("<tr>");
					out.println("<th>2 * " + i + " = </th>");
					out.println("<td>" + (2*i) + "</td>");
					out.println("</tr>");
				}
			%>
		</table>
	
	</body>
</html>