package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;
import com.javalec.ex.BDTO.BDTO;

public class BModifyViewcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		BDAO bdao = new BDAO();
		BDTO bdto =  bdao.modify_view(bId);
		
		request.setAttribute("modify_view", bdto);

	}

}
