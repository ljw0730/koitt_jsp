package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.Bcommand.BCommand;
import com.javalec.ex.Bcommand.BContentViewcommand;
import com.javalec.ex.Bcommand.BDeletecommand;
import com.javalec.ex.Bcommand.BListcommand;
import com.javalec.ex.Bcommand.BModifyViewcommand;
import com.javalec.ex.Bcommand.BModifycommand;
import com.javalec.ex.Bcommand.BReplyViewcommand;
import com.javalec.ex.Bcommand.BReplycommand;
import com.javalec.ex.Bcommand.BWritecommand;

/**
 * Servlet implementation class BFront
 */
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
		System.out.println("actionDo 들어옴");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String con = uri.substring(conPath.length());
		
		BCommand bcom = null;
		
		if(con.equals("/list.do")) {
			bcom = new BListcommand();
			bcom.execute(request, response);
			
			viewPage = "list.jsp";
		}
		else if(con.equals("/content_view.do")) {
			bcom = new BContentViewcommand();
			bcom.execute(request, response);
			
			viewPage="content_view.jsp";
		}
		else if(con.equals("/write_view.do")) {
			viewPage="write_view.jsp";
		}
		else if(con.equals("/write.do")) {
			bcom = new BWritecommand();
			bcom.execute(request, response);
			
			viewPage="list.do";
		}
		else if(con.equals("/delete.do")) {
			bcom = new BDeletecommand();
			bcom.execute(request, response);
			
			viewPage="list.do";
		}
		else if(con.equals("/modify_view.do")) {
			bcom = new BModifyViewcommand();
			bcom.execute(request, response);
			
			viewPage = "modify_view.jsp";
		}
		else if(con.equals("/modify.do")) {
			bcom = new BModifycommand();
			bcom.execute(request, response);
			
			viewPage = "list.do";
		}
		else if(con.equals("/reply_view.do")) {
			bcom = new BReplyViewcommand();
			bcom.execute(request, response);
			
			viewPage = "reply_view.jsp";
		}
		else if(con.equals("/reply.do")) {
			bcom = new BReplycommand();
			bcom.execute(request, response);
			
			viewPage = "list.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	
}
