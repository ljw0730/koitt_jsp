<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - html 테이블 for문 연습</title>
		<style type="text/css">
			table {
				font-size: 15px;
				text-align: center;
				border-collapse: collapse;
			}
			tr, th, td {
				border-bottom: 1px solid black;
			}
			th {
				width: 100px; height: 20px; 
			}
			td {
				width: 100px; height: 20px;
			}
		
		</style>
	</head>
	<body>
		
		<!-- html 주석 - html 소스보기에서는 나타난다. -->
		<%-- jsp 주석 : html 소스보기에서 나타난다. --%>
		<h1>범위, 더하기, 곱하기</h1>
		<table>
			<tr>
				<th>범위</th>
				<th>더하기</th>
				<th>곱하기</th>
			</tr>
			<tr>
				<%
					int sum = 0;
					double mul = 1;
					int min = 1;
					int max = 10;
					
					for(int i = min; i <= max; i++) {
						sum += i;
						mul *= i;
					}
					out.println("<td>" + min + " ~ " + max + "</td>");
					out.println("<td>" + sum + "</td>");
					out.println("<td>" + mul + "</td>");
				%>
			</tr>
			<tr>
				<%
					sum = 0;
					mul = 1;
					min = 1;
					max = 50;
					
					for(int i = min; i <= max; i++) {
						sum += i;
						mul *= i;
					}
					out.println("<td>" + min + " ~ " + max + "</td>");
					out.println("<td>" + sum + "</td>");
					out.println("<td>" + mul + "</td>");
				%>
			</tr>
			<tr>
				<%
					sum = 0;
					mul = 1;
					min = 1;
					max = 100;
					
					for(int i = min; i <= max; i++) {
						sum += i;
						mul *= i;
					}
					out.println("<td>" + min + " ~ " + max + "</td>");
					out.println("<td>" + sum + "</td>");
					out.println("<td>" + mul + "</td>");
				%>
			</tr>
							
		</table>
	
	</body>
</html>