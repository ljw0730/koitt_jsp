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
		
		<%!
			int sum=0;
			double multi = 1;
		%>
		
		<%!
			public int sum(int a, int b) {
				sum = 0;
				for(int i = a; i <= b; i++) {
					sum += i;
				}
				return sum;
			}
		%>

		<%!
			public double multi(int a, int b) {
				multi = 1;
				for(int i = a; i <= b; i++) {
					multi *= i;
				}
				return multi;			
			}
		
		%>
		
		<h1>범위, 더하기, 곱하기</h1>
		<table>
			<tr>
				<th>범위</th>
				<th>더하기</th>
				<th>곱하기</th>
			</tr>
			<tr>
				<th>1~10</th>
				<td>
					<%= sum(1, 10) %>
				</td>
				<td>
					<%=	multi(1, 10) %>
				</td>
			</tr>
			<tr>
				<th>1~50</th>
				<td>
					<%= sum(1, 50) %>
				</td>
				<td>
					<%=	multi(1, 50) %>
				</td>
			</tr>
			<tr>
				<th>1~100</th>
				<td>
					<%= sum(1, 100) %>
				</td>
				<td>
					<%=	multi(1, 100) %>
				</td>
			</tr>
			
			
							
		</table>
	
	</body>
</html>