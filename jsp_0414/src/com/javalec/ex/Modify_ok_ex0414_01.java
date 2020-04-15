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

@WebServlet("/Modify_Ok")
public class Modify_ok_ex0414_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
    
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id;
	String pw;
	String name;
	String phone1;
	String phone2;
	String phone3;
	String gender;
	
    public Modify_ok_ex0414_01() {
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
		session = request.getSession();
		
		id = (String)session.getAttribute("user_id");
		pw = request.getParameter("pw1");
		name = request.getParameter("name");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		if(pw_check()) {
			System.out.println("pw 비교 ok!");
			
			String sql = "update member2 set name='"+name+"', phone1='"+phone1+"', phone2='"
						+phone2+"', phone3='"+phone3+"', gender='"+gender+"' where id='"+id+"'";
			System.out.println(sql);
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
				stmt = con.createStatement();
				int ch = stmt.executeUpdate(sql);
				
				if(ch == 1) {
					response.sendRedirect("ex0414_01_index.jsp");
					
					HttpSession session = request.getSession();
					session.setAttribute("user_name", name);
				}
				else {
					// sql 문이 실패한 경우 
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("ex0414_01_modify.jsp");
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
					response.sendRedirect("ex0414_01_modify.jsp");
				}
			}
		}
		else {
			
		//	response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter(); 
			writer.println("<html>");
			writer.println("<head>");
			writer.println("<title></title>");
			writer.println("<meta charset='utf-8'>"); 
			writer.println("</head>");
			writer.println("<body>");
			writer.println("<script>alert('비밀번호가 틀립니다.');"); 
			writer.println("history.back(-1);</script>");
			writer.println("</body>");
			writer.println("</html>");
			//response.sendRedirect("ex0414_01_modify.jsp");
		}
	}
	
	public boolean pw_check() {
		boolean check = false;
		String user_pw = (String)session.getAttribute("user_pw");
		if(user_pw.equals(pw)) {
			check = true;
		}
		else {
			check = false;
		}
		return check;
	}
}
