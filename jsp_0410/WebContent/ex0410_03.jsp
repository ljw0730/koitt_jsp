<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "ora_user";
	String upw = "1234";

	int num;
	int grade;
	String name;
	String payment_state;
	String subject;
	int price;
	String payment_type;
%>    
    
    
    
<!DOCTYPE html>
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
		<h2>학생 정보</h2>
		<table>
			<tr>
				<th>학번</th>
				<th>학년</th>
				<th>이름</th>
				<th>납부여부</th>
				<th>과목</th>
				<th>금액</th>
				<th>납부유형</th>
			</tr>
			
		
		
		<%
			try{
				Class.forName(driver);
				conn = DriverManager.getConnection(url, uid, upw);
				stmt = conn.createStatement();
				String sql = "select * from member3";
				rs = stmt.executeQuery(sql);
			    
				while(rs.next()) {
					num = rs.getInt("num");
					grade = rs.getInt("grade");
					name = rs.getString("name");
					payment_state = rs.getString("payment_state");
					subject = rs.getString("subject");
					price = rs.getInt("price");
					payment_type = rs.getString("payment_type");
					
					 
					 
					out.println("<tr>");
					out.println("<td>" + num + "</td>");
					out.println("<td>" + grade + "</td>");
					out.println("<td>" + name + "</td>");
					out.println("<td>" + payment_state + "</td>");
					out.println("<td>" + subject + "</td>");
					out.println("<td>" + price + "</td>");
					out.println("<td>" + payment_type + "</td>");
					out.println("</tr>");
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try{
					if(rs != null) {
						rs.close();
					}
					if(stmt != null) {
						stmt.close();
					}
					if(conn != null) {
						conn.close();
					}
					
				}
				catch(Exception e2) {
					e2.printStackTrace();
				}
				
			}
			
			 
					
		
		
		%>
		</table>
		
		
	</body>
</html>