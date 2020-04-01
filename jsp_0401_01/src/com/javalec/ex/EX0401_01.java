package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EX0401_01
 */
@WebServlet("/Ex01")
public class EX0401_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	// 주소로 바로 접근시 doGet 메소드가 호출.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet으로 들어옴");
		
		// 현재 doGet으로 들어오면 이는 html형태의 UTF-8로된 작성할 문서임.
		response.setContentType("text/html; charset=UTF-8");
		
		// response의 getWriter의 객체를 writer에 넣어라.
		// response.getWriter() : html화면으로 출력을 해주는 객체
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet 시작 - servlet에서의 html 구문 작성하기</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>doGet 로그인페이지</h1>");
		writer.println("<p>로그인하기 위해서 from태그로 화면을 작성함.</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost으로 들어옴");
		
		// 현재 doPost으로 들어오면 이는 html형태의 UTF-8로된 작성할 문서임.
		response.setContentType("text/html; charset=UTF-8");
		
		// response의 getWriter의 객체를 writer에 넣어라.
		// response.getWriter() : html화면으로 출력을 해주는 객체
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet 시작 - servlet에서의 html 구문 작성하기</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>doPost 로그인페이지</h1>");
		writer.println("<p>로그인하기 위해서 from태그로 화면을 작성함.</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

}
