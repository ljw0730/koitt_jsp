package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;

public class BNoticeModifycommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		System.out.println("bTitle : " + bTitle);
		System.out.println("bContent : " + bContent);
		
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		int check = nbdao.notice_modify(bId, bTitle, bContent);
		
		
	}

}
