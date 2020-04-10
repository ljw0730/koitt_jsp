<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
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
		
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			// Tomcat과 JDBC 를 연결하는 부분
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// JDBC와 Oracle 를 연겨하는 부분
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			
			// SQL 구문을 실행 시킬 수 있는 객체 생성
			stmt = conn.createStatement();

			// SQL 쿼리 구문
			String sql = "select * from member3";
			
			// SQL 실행후 rs객체 받음
			rs = stmt.executeQuery(sql);
		
			
			while(rs.next()) {
				int num = rs.getInt("num");
				int grade = rs.getInt("grade");
				String name = rs.getString("name");
				String payment_state = rs.getString("payment_state");
				String subject = rs.getString("subject");
				int price = rs.getInt("price");
				String payment_type = rs.getString("payment_type");
				
				out.println("학번 : " + num + "<br/>");
				out.println("학년 : " + grade + "<br/>");
				out.println("이름 : " + name + "<br/>");
				out.println("납부여부 : " + payment_state + "<br/>");
				out.println("과목 : " + subject + "<br/>");
				out.println("금액 : " + price + "<br/>");
				out.println("납부유형 : " + payment_type + "<br/>");
				out.println("-------------------------------<br/>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
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
				
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	
	%>

		
	</body>
</html>