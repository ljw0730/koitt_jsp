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
	
	int employee_id = 0;
	String emp_name = null;
	float salary = 0;
	

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
				
				String search_type = request.getParameter("search_type");
				String sort_type = request.getParameter("sort_type");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				
				out.println(search_type);
				out.println(start);
					
				String sort = "";
				switch(sort_type) {
					case "employee_id_low":
						sort = " order by employee_id asc";
						break;
					
					case "employee_id_high":
						sort = " order by employee_id desc";
						break;
					
					case "salary_low" :
						sort = " order by salary asc";
						break;
						
					case "salary_high" :
						sort = " order by salary desc";
						break;
				}
				
				
				String sql = "";
				switch(search_type) {
					case "sch_name" :
						sql ="select employee_id, emp_name, salary from employees " + 
								"where emp_name like '%" + start + "%'"
								+ sort;
						break;
					case "sch_salary" :
						sql = "select employee_id, emp_name, salary from employees " +
								"where salary between " + start + " and " + end
								+ sort;
				
				}
								
				// SQL 실행후 rs객체 받음
				rs = stmt.executeQuery(sql);
				
				out.println("<h2> 월 급 정 보 </h2>");
				
				while(rs.next()) {
					employee_id = rs.getInt("employee_id");
					emp_name = rs.getString("emp_name");
					salary = rs.getFloat("salary");
										
					out.println("사원번호 : " + employee_id + " ");
					out.println("사원이름 : " + emp_name + " ");
					out.println("월급 : " + salary + "<br/>");
				}
				
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