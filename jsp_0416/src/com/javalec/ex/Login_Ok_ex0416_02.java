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
import javax.servlet.http.HttpSession;

@WebServlet("/Login_Ok")
public class Login_Ok_ex0416_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String login_id;
	String login_pw;
	
	String sql;
	String id;
	String pw;
	
    public Login_Ok_ex0416_02() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 들어옴");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 들어옴");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		login_id = request.getParameter("id");
		login_pw = request.getParameter("pw");
		
		sql = "select id, pw from lms_member where id='" + login_id + "' and pw='" + login_pw + "'";
		System.out.println(sql);
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				do {
					id = rs.getString("id");
					pw = rs.getString("pw");
					
					HttpSession session = request.getSession();
					session.setAttribute("user_id", id);
					session.setAttribute("user_pw", pw);
					session.setAttribute("auth_user", id);
					
					response.sendRedirect("ex0416_02_main.jsp");
					
					
				} while(rs.next());
			}
			else {
				// 데이터가 없는 경우
				response.setCharacterEncoding("UTF-8");
				
				response.setContentType("text/html; charset=UTF-8");
				String str;
				str="<script type=\"text/javascript\">\r\n" + 
				     "	alert(\"아이디 또는 패스워드가 잘못되었습니다. 다시 입력해주세요.\");\r\n" + 
				     "	history.back(-1);\r\n" + 
				     "</script>";
				// \r\n => 단락을 나눈다.
				PrintWriter writer = response.getWriter();
				writer.println("<html><head></head><body>");
				writer.println(str);
				writer.println("</body></html>");
				writer.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.setCharacterEncoding("UTF-8");
			
			response.setContentType("text/html; charset=UTF-8");
			String str;
			str="<script type=\"text/javascript\">\r\n" + 
			     "	alert(\"아이디 또는 패스워드가 잘못되었습니다. 다시 입력해주세요.\");\r\n" + 
			     "	location.href='ex0416_02_login.jsp';\r\n" + 
			     "</script>";
			// \r\n => 단락을 나눈다.
			PrintWriter writer = response.getWriter();
			writer.println("<html><head></head><body>");
			writer.println(str);
			writer.println("</body></html>");
			writer.close();
			
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
				response.setCharacterEncoding("UTF-8");
				
				response.setContentType("text/html; charset=UTF-8");
				String str;
				str="<script type=\"text/javascript\">\r\n" + 
				     "	alert(\"아이디 또는 패스워드가 잘못되었습니다. 다시 입력해주세요.\");\r\n" + 
				     "	location.href='ex0416_02_login.jsp';\r\n" + 
				     "</script>";
				// \r\n => 단락을 나눈다.
				PrintWriter writer = response.getWriter();
				writer.println("<html><head></head><body>");
				writer.println(str);
				writer.println("</body></html>");
				writer.close();
			}
		}
		
	}

}
