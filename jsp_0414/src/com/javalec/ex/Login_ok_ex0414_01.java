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

@WebServlet("/Login_ok")
public class Login_ok_ex0414_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login_ok_ex0414_01() {
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

	// 프로그램 구현
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String login_id;
		String login_pw;
		
		String id;
		String pw;
		String name;
		String phone1;
		String phone2;
		String phone3;
		String gender;
		
		login_id = request.getParameter("id");
		login_pw = request.getParameter("pw");
		
		String sql = "select * from member2 where id='" + login_id + "' and pw='" + login_pw + "'";
				
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			// select - executeQuery();
			// insert, update, delete - executeUpdate();
			
			
			if(rs.next()) {
				// id, pw 가 있을때
				
				do {
					id = rs.getString("id");
					pw = rs.getString("pw");
					name = rs.getString("name");
					phone1 = rs.getString("phone1");
					phone2 = rs.getString("phone2");
					phone3 = rs.getString("phone3");
					gender = rs.getString("gender");
					
					// servlet에서 세션가져오기.
					HttpSession session = request.getSession();
					session.setAttribute("user_id", id);
					session.setAttribute("user_pw", pw);
					session.setAttribute("user_name", name);
					session.setAttribute("auth_user", id);
					
					response.sendRedirect("ex0414_01_index.jsp");
				} while(rs.next());
			}
			else {
				// id, pw 가 없을때
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter(); 
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<title></title>");
				writer.println("<meta charset='utf-8'>"); 
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<script>alert('아이디 또는 비밀번호가 틀립니다.');"); 
				writer.println("history.back(-1);</script>");
				writer.println("</body>");
				writer.println("</html>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ex0414_01_index.jsp");
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
				response.sendRedirect("ex0414_01_index.jsp");
			}
		}
	}
}
