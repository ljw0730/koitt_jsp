package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/F_ok")
public class Form_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException {
		System.out.println("객체 생성 시 init() 메소드 실행");
	}

	public void destroy() {
		System.out.println("객체 종료 시 destroy() 메소드 실행");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("doGet() 메소드 실행");
		
		// name, id, pw, hobby, major, address
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 취미는 복수로 들어 올수 있기 때문에 배열로 받는다.
		String[] hobby = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String address = request.getParameter("address");
		
		
		//charset=UTF-8 : 현재 페이지 에서 한글을 표현할때
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet 연습 - 회원가입 정보</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("이름 : " + name + "<br/>");
		writer.println("아이디 : " + id + "<br/>");
		writer.println("패스워드 : " + pw + "<br/>");
		// 취미는 복수로 들어 올수 배열로 처리한다.
		writer.println("취미 : " + Arrays.toString(hobby) + "<br/>");
//		writer.println("취미 : ");
//		for(int i = 0; i < hobby.length; i++) {
//			writer.println(hobby[i] + " ");
//		}
//		writer.println("<br/>");
		writer.println("전공 : " + major + "<br/>");
		writer.println("주소 : " + address + "<br/>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doPost() 메소드 실행");
		
		// 받은 내용들을 뿌려줄때 한글지원
		request.setCharacterEncoding("UTF-8");
		
		
		// name, id, pw, hobby, major, address
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 취미는 복수로 들어 올수 있기 때문에 배열로 받는다.
		String[] hobby = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String address = request.getParameter("address");
		
		
		//charset=UTF-8 : 현재 페이지 에서 한글을 표현할때
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet 연습 - 회원가입 정보</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("이름 : " + name + "<br/>");
		writer.println("아이디 : " + id + "<br/>");
		writer.println("패스워드 : " + pw + "<br/>");
		// 취미는 복수로 들어 올수 배열로 처리한다.
		writer.println("취미 : " + Arrays.toString(hobby) + "<br/>");
//		writer.println("취미 : ");
//		for(int i = 0; i < hobby.length; i++) {
//			writer.println(hobby[i] + " ");
//		}
//		writer.println("<br/>");
		writer.println("전공 : " + major + "<br/>");
		writer.println("주소 : " + address + "<br/>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		
		
		
		
	}

}
