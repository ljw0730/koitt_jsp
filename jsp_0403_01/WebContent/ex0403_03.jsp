<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - html 테이블 for문 구구단2,3단 연습</title>
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
		<h1>구구단 2, 3단 출력</h1>
		<table>
			<colgroup>
				<col style="width:100px">
				<col style="width:300px">
				<col style="width:100px;">
			</colgroup>
			<tr>
				<th>단</th>
				<th>계산식</th>
				<th>작성일</th>
			</tr>
			<%
				for(int i = 2; i <= 3; i++) {
					for(int j = 1; j <= 9; j++) {
						out.println("<tr>");
						out.println("<td>"+ i +"단</td>");
						out.println("<td>"+ i + " * " + j + " = " + i*j);
						out.println("<td>2020-04-03</td>");
						out.println("</tr>");
					}
				}
			
			%>
							
		</table>
	
	</body>
</html>