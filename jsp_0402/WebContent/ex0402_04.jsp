<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 회원가입정보보기 연습</title>
		<!-- form_html_02.html 와 연결되어 있음 -->
		
		<style type="text/css">
			table {
				font-size: 15px;
				border: 1px solid black;
				border-collapse: collapse;
			}
			tr, th, td {
				border: 1px solid black;
			}
			th {
				width: 200px; height: 20px;
			}
			td {
				widht: 400px;
			}
		</style>
	</head>
	<body>
		<h3>회원가입 정보보기</h3>
		<table>
			<tr>
				<th>이름</th>
				<td><%= request.getParameter("name") %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%= request.getParameter("id") %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%= request.getParameter("pw1") %></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><%= request.getParameter("pw2") %></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<%= request.getParameter("f_tell") %>
					-
					<%= request.getParameter("m_tell") %>
					-
					<%= request.getParameter("l_tell") %>
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><%= request.getParameter("job") %></td>
			</tr>
			<tr>
				<th>결혼여부</th>
				<td><%= request.getParameter("marital_status") %></td>
			</tr>
			<tr>
				<th>관심사</th>
				<td>
					<%= Arrays.toString(request.getParameterValues("interests")) %>
				</td>
			</tr>
			<tr>
				<th>직업 - 한글</th>
				<td>
					<%
						String job = request.getParameter("job");
						if(job.equals("student")) {
							out.println("학생");
						}
						else if(job.equals("worker")) {
							out.println("회사원");
						}
						else if(job.equals("slef")) {
							out.println("자영업자");
						}
						else if(job.equals("housewife")) {
							out.println("전업주부");
						}
						else if(job.equals("etc")) {
							out.println("기타");
						}
					%>
				</td>
			</tr>
			<tr>
				<th>결혼여부 - 한글</th>
				<td>
					<%
						String marital_status = request.getParameter("marital_status");
						if(marital_status.equals("y")) {
							out.println("예");
						}
						else if(marital_status.equals("n")) {
							out.println("아니오");
						}
					%>
				</td>
			</tr>
			<tr>
				<th>관심사 - 한글</th>
				<td>
					<%
						String[] interests = request.getParameterValues("interests");
						for(int i = 0; i < interests.length; i++) {
							if(interests[i].equals("computer")) {
								out.print("컴퓨터/인터넷");
							}
							else if(interests[i].equals("movie")) {
								out.print("영화/비디오");
							}
							else if(interests[i].equals("music")) {
								out.print("음악");
							}
							else if(interests[i].equals("shopping")) {
								out.print("쇼핑");
							}
							else if(interests[i].equals("game")) {
								out.print("게임");
							}
							else if(interests[i].equals("culture")) {
								out.print("문화");
							}
							else if(interests[i].equals("cooking")) {
								out.print("요리");
							}
							else if(interests[i].equals("interier")) {
								out.print("인테리어");
							}
							else if(interests[i].equals("leisure")) {
								out.print("레저/여가");
							}
							else if(interests[i].equals("health")) {
								out.print("건강/다이어트");
							}
							
							if(i != (interests.length-1)) {
								out.print(", ");
							}
						}
					%>
				</td>
			</tr>
			
			
		
		</table>
	</body>
</html>