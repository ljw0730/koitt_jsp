package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;

public class BNoticeDeletecommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		int check = nbdao.notice_delete(bId);
		
		
	}

}
