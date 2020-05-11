package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BCommand.BCommand;
import com.javalec.ex.BCommand.JJoinInsertDbcommand;

@WebServlet("*.doj")
public class BFront_join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFront_join() {
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
		System.out.println("actionDo 들어옴");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = "";
		
		BCommand bcom = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/join.doj")) {
			viewPage = "join01_terms.jsp";
		}
		else if(com.equals("/join02_info_input.doj")) {
			viewPage = "join02_info_input.jsp";
		}
		else if(com.equals("/join_input_db.doj")) {
			bcom = new JJoinInsertDbcommand();
			bcom.execute(request, response);
			
			viewPage = "join03_success.jsp"; 
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
