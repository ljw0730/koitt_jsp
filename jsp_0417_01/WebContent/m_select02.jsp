<%@page import="com.javalec.ex.MemberDAO02"%>
<%@page import="com.javalec.ex.MemberDTO02"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커낵션 풀</title>
		<style type="text/css">
			#main_list table{
				width: 100%;
			    border-collapse: collapse;
			    border-spacing: 0;
			    font-size: 11.5px;
			    border: 1px solid #d6dce7;
			    text-align: center;
			}
			
			#main_list table tr th{
				background: #6f809a;
			    color: #fff;
			    border: 1px solid #60718b;
			    font-weight: normal;
			    padding: 8px 5px;
			    font-size: 0.92em;
			    height: 35px;
			}
			
			#main_list table tr td{
				height: 35px;
			}
			
			#main_list table tr:nth-of-type(2n){
				background: #eff3f9;
			}
		
		</style>
	</head>
	<body>
		<h2>회원정보 리스트</h2>
		<div id="main_list">
			<table border="1">
				<tr>
					<th>회원 아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>전화번호1</th>
					<th>전화번호2</th>
					<th>전화번호3</th>
					<th>성별</th>
				</tr>
		
		<%
			MemberDAO02 mdao = new MemberDAO02();
			ArrayList dtos = mdao.memder_Select();
			MemberDTO02 mdto = new MemberDTO02();
			
			String id, pw, name, phone1, phone2, phone3, gender;
			
			for(int i = 0; i < dtos.size(); i++) {
				mdto = (MemberDTO02)dtos.get(i);
				
				id = mdto.getId();
				pw = mdto.getPw();
				name = mdto.getName();
				phone1 = mdto.getPhone1();
				phone2 = mdto.getPhone2();
				phone3 = mdto.getPhone3();
				gender = mdto.getGender();
				
		%>
				<tr>
					<td><a href="#"><%= id %></a></td>
					<td><%= pw %></td>
					<td><%= name %></td>
					<td><%= phone1 %></td>
					<td><%= phone2 %></td>
					<td><%= phone3 %></td>
					<td><%= gender %></td>
				</tr>
		<% 			
			}
		%>		
			</table>
		</div>
			
	</body>
</html>