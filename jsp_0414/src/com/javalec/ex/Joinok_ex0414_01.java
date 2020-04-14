package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Join_Ok")
public class Joinok_ex0414_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Joinok_ex0414_01() {
    	super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 으로 들어옴");
		actionDo(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 으로 들어옴");
		actionDo(request, response);
		
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id;
		String pw;
		String name;
		String phone1;
		String phone2;
		String phone3;
		String gender;
		
		id = request.getParameter("id");
		pw = request.getParameter("pw1");
		name = request.getParameter("name");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		//String sql = "insert into member2 values ('ccc', '1234', '김유신', '010', '3333', '3333', '남자')";
		String sql = "insert into member2 values ('" + id + "', '" + pw + "', '" + name + "', '" 
					+ phone1 + "', '" + phone2 + "', '" + phone3 +"', '" + gender +"')";
		//String sql = "insert into member2 values ('" +id+ "', '" +pw+ "', '" +name+ "', '" +phone1+ "', '" +phone2+ "', '" +phone3+ "', '" +gender+ "')";
			
		
		Connection con = null;
		Statement stmt = null;
		//ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			stmt = con.createStatement();
			int result = stmt.executeUpdate(sql);
			// 제대로 저장되면 1, 저장 실패면 0 리턴
			
			//저장결과 페이지 분기
			if(result == 1) {
				response.sendRedirect("ex0414_01_joinResult.jsp");
			}
			else {
				response.setCharacterEncoding("UTF-8");
				PrintWriter writer = response.getWriter(); 
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<title>Joinok_ex0414_01.java(servlet) - error</title>");
				writer.println("<meta charset='utf-8'>");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<script>alert('저장이 되지 않습니다. 다시 입력해 주세요.');");
				writer.println("location.href='ex0414_01_join.html';</script>");
				writer.println("</body>");
				writer.println("</html>");
			}
			
		} catch (Exception e) {
			// 에러발생
			e.printStackTrace();
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<html>");
			writer.println("<head>");
			writer.println("<title>Joinok_ex0414_01.java(servlet) - error</title>");
			writer.println("<meta charset='utf-8'>");
			writer.println("</head>");
			writer.println("<body>");
			writer.println("<script>alert('저장이 되지 않습니다. 다시 입력해 주세요.');");
			writer.println("location.href='ex0414_01_join.html';</script>");
			writer.println("</body>");
			writer.println("</html>");
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

}
