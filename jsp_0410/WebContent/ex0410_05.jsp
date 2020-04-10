<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "ora_user";
	String upw = "1234";

	String pro_type;
	String pro_code;
	String pro_name;
	String rentee;
	int pro_guarantee;
	String phone;
	
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB 연결 연습</title>
		<style type="text/css">
			h2 {
				width: 1000px;
				margin: 30px auto;
				text-align: center;
				font-size: 30px;
			}
			table {
				width: 1000px;
				border-collapse: collapse;
				text-align: center;
				font-size: 20px;
				margin: 50px auto;
			}
			tr, th, td {
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<table>
			<tr>
				<th>상품구분</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>임대인</th>
				<th>보증여부</th>
				<th>연락처</th>
			</tr>
			<%
				Class.forName(driver);
				conn = DriverManager.getConnection(url, uid, upw);
				stmt = conn.createStatement();
				String sql = "select * from instrument";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					pro_type = rs.getString("pro_type");
					pro_code = rs.getString("pro_code");
					pro_name = rs.getString("pro_name");
					rentee = rs.getString("rentee");
					pro_guarantee = rs.getInt("pro_guarantee");
					String pro_guarantee_str = "";
					switch(pro_guarantee) {
						case 0 :
							pro_guarantee_str = "미보증";
							break;
						case 1 : 
							pro_guarantee_str = "보증";
							break;
					}
					phone = rs.getString("phone");
					
					out.println("<tr>");
					out.println("<td>" + pro_type + "</td>");
					out.println("<td>" + pro_code + "</td>");
					out.println("<td>" + pro_name + "</td>");
					out.println("<td>" + rentee + "</td>");
					out.println("<td>" + pro_guarantee_str + "</td>");
					out.println("<td>" + phone + "</td>");
					out.println("</tr>");
					
				}
			
			%>
		</table>
	</body>
</html>