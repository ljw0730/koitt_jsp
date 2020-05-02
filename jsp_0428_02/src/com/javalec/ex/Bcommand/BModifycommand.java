package com.javalec.ex.Bcommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;

public class BModifycommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		BDAO bdao = BDAO.getInstance();
		int check = bdao.modify(bId, bTitle, bContent);
		
				
	}

}
