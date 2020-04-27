package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.Bcommand.BListcommand;
import com.javalec.ex.Bcommand.Bcommand;

@WebServlet("*.do")
public class BFront extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFront() {
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
		System.out.println("actionDo 호출됨");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Bcommand comm = null;

		String uri = request.getRequestURI();
		// /jsp_0427_01/list.do
		String conpath = request.getContextPath();
		// /jsp_0427_01
		String com = uri.substring(conpath.length());
		// /list.do
		
		// 호출 페이지 분기
		if(com.equals("/list.do")) {
			comm = new BListcommand();
			comm.execute(request, response);
			
			viewPage = "list.jsp";
			
			
		}
//		else if(com.equals("/content_view.do")) {
//			comm = new BContentcommand();
//			comm.execute(request, response);
//			
//			viewPage = "content_view.jps";
//		}
//		else if(com.equals("/write_view.do")) {
//			comm = new Bwritecommand();
//			comm.execute(request, response);
//			
//			viewPage = "write_view.jps";
//		}
//		else if(com.equals("/reply_view.do")) {
//			comm = new BReplyViewcommand();
//			comm.execute(request, response);
//			
//			viewPage = "reply_view.jps";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	
}
