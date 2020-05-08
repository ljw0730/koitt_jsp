package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BCommand.BCommand;
import com.javalec.ex.BCommand.EEventModifyViewcommand;
import com.javalec.ex.BCommand.EEventContentViewcommand;
import com.javalec.ex.BCommand.EEventListcommand;
import com.javalec.ex.BCommand.EEventModifycommand;
import com.javalec.ex.BCommand.EEventWritecommand;
import com.javalec.ex.BCommand.EEventdeletecommad;

@WebServlet("*.doe")
public class BFront_event extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public BFront_event() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이벤트 doGet 들어옴");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이벤트 doPost 들어옴");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이벤트 actionDo 들어옴");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = "";
		
		BCommand bcom = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/event_list.doe")) {
			bcom = new EEventListcommand();
			bcom.execute(request, response);
			
			viewPage = "event_list.jsp";
		}
		else if(com.equals("/event_write_view.doe")) {
			viewPage = "event_write_view.jsp";
		}
		else if(com.equals("/event_write.doe")) {
			bcom = new EEventWritecommand();
			bcom.execute(request, response);
			
			viewPage = "event_list.doe";
		}
		else if(com.equals("/event_content_view.doe")) {
			bcom = new EEventContentViewcommand();
			bcom.execute(request, response);
			
			viewPage = "event_content_view.jsp";
		}
		else if(com.equals("/event_delete.doe")) {
			bcom = new EEventdeletecommad();
			bcom.execute(request, response);
			
			viewPage = "event_list.doe";
		}
		else if(com.equals("/evenvt_modify_view.doe")) {
			bcom = new EEventModifyViewcommand();
			bcom.execute(request, response);
			
			viewPage = "event_modify_view.jsp";
		}
		else if(com.equals("/event_modify.doe")) {
			bcom = new EEventModifycommand();
			bcom.execute(request, response);
			
			viewPage = "event_list.doe";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8"); 

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		//dispatcher.include(request, response);
		
	}
}
