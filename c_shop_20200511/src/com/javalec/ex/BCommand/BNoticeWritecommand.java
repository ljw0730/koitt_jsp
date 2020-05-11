package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;

public class BNoticeWritecommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		int check = nbdao.notice_write(bName, bTitle, bContent);
		
	}

}
