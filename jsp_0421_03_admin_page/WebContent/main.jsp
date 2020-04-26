<%@page import="com.javalec.ex.MemberDAO"%>
<%@page import="com.javalec.ex.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("auth_user") == null) {
%>
		<script>
			alert("로그인을 하지 않았습니다. 로그인을 해주세요.");
			location.href="login.jsp";
		</script>
<%		
	}

	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	MemberDAO mdao = MemberDAO.getInstance();
	list = mdao.getMembers();

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>>JSP - 커넥션 풀 연습 - 회원관리 프로그램(메인화면)</title>
		<style type="text/css">
			#main_list table {
				width: 100%;
				font-size: 12px;
				text-align: center;
				border: 1px solid #d6dce7;
				border-collapse: collapse;
				border-spacing: 0;
			}
			#main_list table tr th {
				height: 35px;
				font-size : 0.92em;
				font-weight: normal;
				color: #fff;
				background: #6f809a;
				padding: 8px 5px;
				border: 1px solid #60718b;
			}
			#main_list table tr td {
				height: 35px;
			}
			#main_list table tr:nth-of-type(2n) {
				background: #eff3f9;
			}
			
							
		</style>	
	</head>
	<body>
		<h2>관리자 페이지</h2>
		<p><a href="logout.jsp">로그아웃</a></p>
		<div id="main_list">
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>이메일</th>
					<th>우편번호</th>
					<th>주소2</th>
					<th>주소3</th>
					<th>가입일자</th>
					<th>수정일자</th>
				</tr>
			<%
				for(int i = 0; i < list.size(); i++) {
					MemberDTO mdto = (MemberDTO)list.get(i);
			%>		
					<tr>
						<td><a href="modify.jsp?id=<%= mdto.getId() %>"><%= mdto.getId() %></a></td>
						<td><%= mdto.getPw() %></td>
						<td><%= mdto.getName() %></td>
						<td><%= mdto.getEmail() %></td>
						<td><%= mdto.getAddress1() %></td>
						<td><%= mdto.getAddress2() %></td>
						<td><%= mdto.getAddress3() %></td>
						<td><%= mdto.getJoin_date() %></td>
						<td><%= mdto.getModify_date() %></td>
					</tr>
			<%	
				}
			%>
			</table>
		</div>
	</body>
</html>