<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 회원가입 정보 예제</title>
		<style type="text/css">
			table {
				width: 600px;
				font-size: 20px;
				border-collapse: collapse;
			}
			tr, th, td {
				border: 1px solid black;
			}
			th {
				width:200px; height: 20px;
			}
			td {
				width: 400px;
			}
		
		</style>
		<!-- JSP request 한글처리 -->
		<% request.setCharacterEncoding("UTF-8"); %>
	</head>
	<body>
		<h3>회원가입 정보</h3>
	
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<!-- 출력방법 1. out.print 이용하기-->
					<%-- out.println(request.getParameter("id")); --%>
					<!-- 출력방법 2. 표현식 사용하기 -->
					<%= request.getParameter("id") %>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%= request.getParameter("pw") %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= request.getParameter("name") %></td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<%= Arrays.toString(request.getParameterValues("hobby")) %>
				 	
				 	<%--
					<%
						String[] hobby = request.getParameterValues("hobby");
				  		out.println(Arrays.toString(hobby));
					%>
					--%>
				</td>
			</tr>
			<tr>
				<th>전공</th>
				<td><%= request.getParameter("major") %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= request.getParameter("address") %></td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<% 
						String[] hobby = request.getParameterValues("hobby");
						for(int i = 0; i < hobby.length; i++) {
							if(hobby[i].equals("book")) {
								out.print("독서");
							}
							else if(hobby[i].equals("cook")) {
								out.print("요리");
							}
							else if(hobby[i].equals("run")) {
								out.print("조깅");
							}
							else if(hobby[i].equals("swim")) {
								out.print("수영");
							}
							
							if(i < (hobby.length-1)) {
								out.print(", ");
							}
						}
					%>
				</td>
			</tr>
			<tr>
				<th>전공</th>
				<td>
					<% 
						String major = request.getParameter("major");
						if(major.equals("kor")) {
							out.println("국어국문학과");
						}
						else if(major.equals("eng")) {
							out.println("영어국문학과");
						}
						else if(major.equals("math")) {
							out.println("수학과");
						}
						else if(major.equals("design")) {
							out.println("디자인학과");
						}
						
					%>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<%
						String address = request.getParameter("address");
						if(address.equals("seoul")) {
							out.println("서울");
						}
						else if(address.equals("gyeonggi")) {
							out.println("경기");
						}
						else if(address.equals("incheon")) {
							out.println("인천");
						}
						
					%>
				</td>
			</tr>
		</table>
		
	</body>
</html>