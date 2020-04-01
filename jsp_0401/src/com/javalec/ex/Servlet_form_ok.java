package com.javalec.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/F_ok")
public class Servlet_form_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Servlet_form_ok() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// method="get" 인 경우 doGet 실행, 주소로 바로 접근해도 doGet 실행
		System.out.println("doGet으로 실행됨.");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// method="post" 인 경우 doPost 실행
		System.out.println("doPost로 실행됨.");
		actionDo(request, response);
	}
	
	// 위의 두 메소드를 기술해야 하는데 이는 힘드므로 어떤걸로 들어오든 사용할 수 있도록 새로운 함수를 만든다.
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
