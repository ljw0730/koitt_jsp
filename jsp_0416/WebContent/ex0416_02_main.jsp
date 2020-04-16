<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String auth_user = (String)session.getAttribute("auth_user");
	if(auth_user == null) {
		String str="<script type=\"text/javascript\">\r\n" + 
			     "	alert(\"로그인을 하지 않았습니다. \n로그인 페이지로 이동합니다.\");\r\n" + 
			     "	location.href='ex0416_02_login.jsp';\r\n" + 
			     "</script>";
			// \r\n => 단락을 나눈다.
		out.println(str);
	} else {
		String str="<script type=\"text/javascript\">\r\n" + 
			     "	alert(\"세션이 남아 있음\");\r\n" + 
			     "</script>";
			// \r\n => 단락을 나눈다.
		out.println(str);
	}


%>    
    
<%!
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
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
	
	String sql;

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 로그인/회원정보입력/회원정보수정 연습 - 메인화면</title>
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
	
		<h2>회원전체 리스트</h2>
		<p><a href="ex0416_02_join.jsp">회원정보 입력</a></p>
				
		<div id="main_list">
			<table border="1">
				<tr>
					<th>회원 아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>휴대전화</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>뉴스레터 수신여부</th>
					<th>SMS 수신여부</th>
				</tr>
	<%
		try{
			sql = "select * from lms_member";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				address = rs.getString("address");
				phone = rs.getString("phone");
				birth = rs.getTimestamp("birth");
				gender = rs.getString("gender");
				news = rs.getString("news");
				sms = rs.getString("sms");
	%>
				<tr>
					<td><a href="ex0416_02_modify.jsp?id=<%= id %>"><%= id %></a></td>
					<td><%= pw %></td>
					<td><%= name %></td>
					<td><%= email %></td>
					<td><%= address %></td>
					<td><%= phone %></td>
					<td><%= birth %></td>
					<td><%= gender %></td>
					<td><%= news %></td>
					<td><%= sms %></td>
				</tr>
	<% 			
			}
	%>		
			</table>
		</div>
	<%		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	%>
	</body>
</html>