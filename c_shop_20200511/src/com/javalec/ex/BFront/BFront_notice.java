package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BCommand.BCommand;
import com.javalec.ex.BCommand.BNoticeContentViewcommand;
import com.javalec.ex.BCommand.BNoticeDeletecommand;
import com.javalec.ex.BCommand.BNoticeListcommand;
import com.javalec.ex.BCommand.BNoticeModifyViewcommand;
import com.javalec.ex.BCommand.BNoticeModifycommand;
import com.javalec.ex.BCommand.BNoticeReplyVeiwcommand;
import com.javalec.ex.BCommand.BNoticeReplycommand;
import com.javalec.ex.BCommand.BNoticeWritecommand;

@WebServlet("*.do")
public class BFront_notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFront_notice() {
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
		
		if(com.equals("/notice_list.do")) {
			bcom = new BNoticeListcommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.jsp";
		}
		else if(com.equals("/search.do")) {
			bcom = new BNoticeListcommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.do";
		}
		else if(com.equals("/notice_content_view.do")) {
			bcom = new BNoticeContentViewcommand();
			bcom.execute(request, response);
			
			viewPage = "notice_content_view.jsp";
		}
		else if(com.equals("/notice_write_view.do")) {
			viewPage = "notice_write_view.jsp";
		}
		else if(com.equals("/notice_write.do")) {
			bcom = new BNoticeWritecommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.do";
		}
		else if(com.equals("/notice_delete.do")) {
			bcom = new BNoticeDeletecommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.do";
		}
		else if(com.equals("/notice_modify_view.do")) {
			bcom = new BNoticeModifyViewcommand();
			bcom.execute(request, response);
			
			viewPage = "notice_modify_view.jsp";
		}
		else if(com.equals("/notice_modify.do")) {
			bcom = new BNoticeModifycommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.do";
		}
		else if(com.equals("/notice_reply_view.do")) {
			bcom = new BNoticeReplyVeiwcommand();
			bcom.execute(request, response);
			
			viewPage = "notice_reply_view.jsp";
		}
		else if(com.equals("/notice_reply.do")) {
			bcom = new BNoticeReplycommand();
			bcom.execute(request, response);
			
			viewPage = "notice_list.do";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
