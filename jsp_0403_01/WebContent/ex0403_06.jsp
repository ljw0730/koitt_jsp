<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - form_calculation.html 받은 값 더하기, 곱하기</title>
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
		
		<%
			String start = request.getParameter("start");
			String end = request.getParameter("end");
		%>
		<%!
			int sum = 0;
			double mul =1;
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
				mul = 1;
				for(int i = a; i <= b; i++) {
					mul *= i;
				}
				return mul;			
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
				<th>
					<%
						out.println(start + " ~ " + end);
					%>
				</th>
				<td>
					<%= sum(Integer.parseInt(start), Integer.parseInt(end)) %>
				</td>
				<td>
					<%= multi(Integer.parseInt(start), Integer.parseInt(end)) %>
				</td>
			</tr>
			
			
			
							
		</table>
	
	</body>
</html>