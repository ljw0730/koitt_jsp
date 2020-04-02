package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SC2")

public class ServletConfig_test02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ServletConfig - context-param 파라미터
		// web.xml파일에 선언하며 모든 Serverlet에 공통적으로 사용하는 변수선언
		// web.xml에 선언
	
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String id = getServletContext().getInitParameter("id");
		String pw = getServletContext().getInitParameter("pw");
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>ServletConfig - context-param 파라미터</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<p>context-param 파라미터: " + id + "</p>");
		writer.println("<p>context-param 파라미터: " + pw + "</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
