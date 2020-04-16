package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Join_Ok")
public class Join_Ok_ex0416_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Connection con = null;
	PreparedStatement pstmt = null;
//	Statement stmt = null;
	int ch;
	
	String id;
	String pw;
	String name;
	String email;
	String address;
	String phone;
	String birth;
	String gender;
	String news;
	String sms;
	
	String sql;
	
    public Join_Ok_ex0416_02() {
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
		
		//request 한글 처리
		request.setCharacterEncoding("UTF-8");
				
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		email = request.getParameter("email");
		address = request.getParameter("address");
		phone = request.getParameter("phone");
		birth = request.getParameter("birth");
		gender = request.getParameter("gender");
		news = request.getParameter("news");
		sms = request.getParameter("sms");
		
		sql = "insert into lms_member values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, birth);
			pstmt.setString(8, gender);
			pstmt.setString(9, news);
			pstmt.setString(10, sms);
			
			ch = pstmt.executeUpdate();
			if(ch == 1) {
				// 데이터가 저장이 잘 되었을때
				response.sendRedirect("ex0416_02_main.jsp");
			}
			else {
				// 데이터가 저장이 안될 때
				response.setCharacterEncoding("UTF-8");
				
				response.setContentType("text/html; charset=UTF-8");
				String str;
				str="<script type=\"text/javascript\">\r\n" + 
				     "	alert(\"저장되지 않았습니다. 다시 시도해 주세요.\");\r\n" + 
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
			     "	alert(\"저장되지 않았습니다. 다시 시도해 주세요.\");\r\n" + 
			     "	history.back(-1);\r\n" + 
			     "</script>";
			// \r\n => 단락을 나눈다.
			PrintWriter writer = response.getWriter();
			writer.println("<html><head></head><body>");
			writer.println(str);
			writer.println("</body></html>");
			writer.close();
			
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
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
