package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SC")

//@WebServlet(urlPatterns = {"/SC"}, initParams = {@WebInitParam(name="id", value="admin"), @WebInitParam(name="pw", value="1234")})
public class ServletConfig_test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ServletConfig - init파라미터
		// 방법 1. web.xml에 선언
		// 방법 2. 어노테이션에 선언
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String id = getInitParameter("id");
		String pw = getInitParameter("pw");
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>ServletConfig - init param 파라미터</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<p>init param 파라미터: " + id + "</p>");
		writer.println("<p>init param 파라미터: " + pw + "</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
