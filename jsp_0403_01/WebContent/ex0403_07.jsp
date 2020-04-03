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
			String hak_num = request.getParameter("hak_num");
			String name = request.getParameter("name");
			String kor = request.getParameter("kor");
			String eng = request.getParameter("eng");
			String math = request.getParameter("math");
			
			int kor1 = Integer.parseInt(kor);
			int eng1 = Integer.parseInt(eng);
			int math1 = Integer.parseInt(math);
		
		%>
		
		<%!
			public int sum(int kor, int eng, int math) {
				return kor + eng + math;
			}
		
			public int avg(int kor, int eng, int math) {
				return (kor + eng + math)/3;
			}
		%>
				
		<h1>학생정보</h1>
		<table>
			<tr>
				<th>
					학번
				</th>
				<td>
					<%= hak_num %>
				</td>
			</tr>
			<tr>
				<th>
					이름
				</th>
				<td>
					<%= name %>
				</td>
			</tr>
			<tr>
				<th>
					국어
				</th>
				<td>
					<%= kor %>
				</td>
			</tr>
			<tr>
				<th>
					영어
				</th>
				<td>
					<%= eng %>
				</td>
			</tr>
			<tr>
				<th>
					수학
				</th>
				<td>
					<%= math %>
				</td>
			</tr>
			<tr>
				<th>
					합계
				</th>
				<td>
					<%= sum(kor1, eng1, math1) %>
				</td>
			</tr>
			<tr>
				<th>
					평균
				</th>
				<td>
					<%= avg(kor1, eng1, math1) %>
				</td>
			</tr>
			
			
			
							
		</table>
	
	</body>
</html>