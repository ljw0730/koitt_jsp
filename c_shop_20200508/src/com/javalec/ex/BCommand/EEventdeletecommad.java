package com.javalec.ex.BCommand;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Event_BDAO;

public class EEventdeletecommad implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int eId = Integer.parseInt(request.getParameter("eId"));
		
		Event_BDAO ebdao = Event_BDAO.getInstance();
		int check = ebdao.event_delete(eId);
		
//		if(check == 1) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter writer = null;
//			try {
//				writer = response.getWriter();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			writer.println("<script>alert('정상');</script>");
//			//writer.close();
//		}
//		else {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter writer = null;
//			try {
//				writer = response.getWriter();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			writer.println("<script>alert('비정상');history.back(-1);</script>");
//			//writer.close();
//		}
		
		request.setAttribute("check", check);
		
	}

}
