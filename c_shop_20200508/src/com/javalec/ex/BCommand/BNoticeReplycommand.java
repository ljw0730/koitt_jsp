package com.javalec.ex.BCommand;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;

public class BNoticeReplycommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		int bStep = Integer.parseInt(request.getParameter("bStep"));
		int bIndent = Integer.parseInt(request.getParameter("bIndent"));
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		
		int check = nbdao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
		
//		String alert_str = "";
//		if(check == 1) {
//		//	alert_str = "<script>alert('답글달기가 정상적으로 처리 되었습니다.');</script>";
//		} else {
//		//	alert_str = "<script>alert('답글달기가 정상적으로 처리 되지 않았습니다.'); history.back(-1);</script>";
//		}
//		
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter writer = response.getWriter();
//		    writer.println("<script type='text/javascript'>");
//		    writer.println("alert('alert 테스트');");
//		    //writer.println("history.back();");
//		    writer.println("</script>");
//		    writer.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
	}

}
