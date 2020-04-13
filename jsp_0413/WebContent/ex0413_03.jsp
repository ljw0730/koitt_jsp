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
	
	String id = null;
	String pw = null;
	String name = null;
	String phone = null;

 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB 연결 연습</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			try {
				// Tomcat과 JDBC 를 연결
				Class.forName(driver);
				// JDBC와 Oracle 를 연결
				conn = DriverManager.getConnection(url, uid, upw);
				// SQL 구문을 실행 시킬 수 있는 객체 생성
				stmt = conn.createStatement();
				String search = request.getParameter("search");
				
				String sql = "select * from member where name like '%" + search + "%' order by id desc";
				//String sql = "select * from member where id='" + search + "'";
				// SQL 실행후 rs객체 받음
				rs = stmt.executeQuery(sql);
				
				out.println("<h2> 회 원 정 보 </h2>");
				
				while(rs.next()) {
					id = rs.getString("id");
					pw = rs.getString("pw");
					name = rs.getString("name");
					phone = rs.getString("phone");
					
					out.println("아이디 : " + id + " ");
					out.println("패스워드 : " + pw + " ");
					out.println("이름 : " + name + " ");
					out.println("전화번호 : " + phone + "<br/>");
				}
				
				out.println("<a href='ex0413_03_form.html'>다시 검색하기</a>");
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					if(conn != null) {
						conn.close();
					}
					if(stmt != null) {
						stmt.close();
					}
					if(rs != null) {
						rs.close();
					}
				}
				catch(Exception e2){
					e2.printStackTrace();
				}
			}
		%>
	</body>
</html>