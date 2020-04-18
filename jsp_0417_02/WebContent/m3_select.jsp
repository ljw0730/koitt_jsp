<%@page import="com.javalec.ex.Member3DTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.ex.Member3DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커낵션 풀 연습</title>
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
			
			#insert_btn {
				width: 100px;
				display: block;
				text-decoration: none;
				color: #000;
				font-size: 15px;
				font-weight: bold;
				background-color: gray;
				padding: 20px;
				margin-bottom: 20px;
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<h2>회원정보 리스트</h2>
		<a href="m3_insert_form.jsp" id="insert_btn">회원정보추가</a>
		<div id="main_list">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>아아디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>뉴스레터 수신여부</th>
					<th>SMS 수신여부</th>
					<th>가입일자</th>
				</tr>
				
				<%
					Member3DAO m3dao = new Member3DAO();
					ArrayList list = m3dao.member_Select();
					Member3DTO m3dto = new Member3DTO();			
					
					int m_num;
					String id;
					String pw;
					String name;
					String email;
					String address;
					String phone;
					Timestamp birth;
					String gender;
					String news;
					String sms;
					Timestamp join_date;
				
					for(int i = 0; i < list.size(); i++) {
						m3dto = (Member3DTO)list.get(i);
						
						m_num = m3dto.getM_num();
						id = m3dto.getId();
						pw = m3dto.getPw();
						name = m3dto.getName();
						email = m3dto.getEmail();
						address = m3dto.getAddress();
						phone = m3dto.getPhone();
						birth = m3dto.getBirth();
						gender = m3dto.getGender();
						news = m3dto.getNews();
						sms = m3dto.getSms();
						join_date = m3dto.getJoin_date();
				%>		
				
						<tr>
							<td><%= m_num %></td>
							<td><%= id %></td>
							<td><%= pw %></td>
							<td><%= name %></td>
							<td><%= email %></td>
							<td><%= address %></td>
							<td><%= phone %></td>
							<td><%= birth %></td>
							<td><%= gender %></td>
							<td><%= news %></td>
							<td><%= sms %></td>
							<td><%= join_date %></td>
						</tr>
				<%		
					}
				%>
			
			</table>
		</div>	
	
	
	</body>
</html>