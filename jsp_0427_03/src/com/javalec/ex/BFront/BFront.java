package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BCommand.BCommand;
import com.javalec.ex.BCommand.BContentcommand;
import com.javalec.ex.BCommand.BListCommand;

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
		
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		BCommand bcom = null;
		
		if(com.equals("/list.do")) {
			// BListCommand() 호출됨
			bcom = new BListCommand();
			bcom.execute(request, response);
			
			viewPage = "list.jsp";
		}
		else if(com.equals("/content_view.do")) {
			// BContentcommand() 호출됨
			bcom = new BContentcommand();
			bcom.execute(request, response);
			
			viewPage = "content_view.jsp";	
		}
		else if(com.equals("/write.do")) {
	//		bcom = new BWritecommand();
			bcom.execute(request, response);
			
			viewPage = "list.do";
		}
		else if(com.equals("/wirite_view.do")) {
			viewPage = "write_view.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
