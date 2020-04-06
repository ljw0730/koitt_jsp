<%@page import="jsp_0406_01.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생입력저장 </title>
		<style type="text/css">
			h1 {
				width: 300px; height: 50px;
				margin: 0 auto 20px;
				border: 1px solid black;
				text-align: center;
			}
									
			table {
				margin: 0 auto;
				border: 1px solid black;
				border-collapse: collapse;
			}
			
			tr, th, td {
				border: 1px solid black;
				text-align: center;
			}
			th, td {
				width: 200px;
			}
			th {
				background-color: #eee;
			}
			div {
				width: 300px;
				margin: 50px auto;
				text-align: center;
				border: 1px solid black;
			}
			button {
				width: 100px; height: 30px;
				display: inline-block;
				margin: 0 auto;
				margin-right: 10px;
			}
			
			
		</style>
	</head>
	<body>
		<h1>학생 성적 출력</h1>
		
		<%-- List에 회원 추가 --%>
		<%! ArrayList<Student> list = new ArrayList<Student>(); %>
		<%
		
			request.setCharacterEncoding("UTF-8");
			String s_num = request.getParameter("s_num");
			String s_name = request.getParameter("s_name");
			int s_kor = Integer.parseInt(request.getParameter("s_kor"));
			int s_eng = Integer.parseInt(request.getParameter("s_eng"));
			int s_math = Integer.parseInt(request.getParameter("s_math"));
			
			Student stu = new Student(s_num, s_name, s_kor, s_eng, s_math);
			list.add(stu);			
		
		%>
	
		<%-- 회원 정보 출력 --%>
			<table class="center">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>국어점수</th>
					<th>영어점수</th>
					<th>수학점수</th>
					<th>합계</th>
					<th>평균</th>
					<th>등수</th>
				</tr>
		<%
			for(int i = 0; i < list.size(); i++) {
				Student ss = (Student)list.get(i);
		%>
		
				<tr>
					<td><%= ss.getS_num() %></td>
					<td>
						<a href="ex0406_02_stu_modify.jsp?s_num=<%= ss.getS_num() %>
								&s_name=<%= ss.getS_name() %>
								&s_kor=<%= ss.getS_kor() %>
								&s_eng=<%= ss.getS_eng() %>
								&s_math=<%= ss.getS_math() %>">
						<%= ss.getS_name() %>
						</a>
					</td>
					<td><%= ss.getS_kor() %></td>
					<td><%= ss.getS_eng() %></td>
					<td><%= ss.getS_math() %></td>
					<td><%= ss.getS_total() %></td>
					<td><%= ss.getS_avg() %></td>
					<td><%= ss.getRank() %></td>
				</tr>
		
		<%
			}
		%>
			</table>
		<div>
			<button><a href="ex0406_02_stu_imform.html">회원정보추가</a></button>
			<button><a href="ex0406_02_stu_list.html">처음화면으로</a></button>
		</div>
		
	</body>
</html>