package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;
import com.javalec.ex.DTO.Notice_BDTO;

public class BNoticeContentViewcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		Notice_BDTO nbdto = nbdao.contentView(bId);
		
		request.setAttribute("content_view", nbdto);
		
	}

}
