package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;
import com.javalec.ex.BDTO.BDTO;

public class BContentcommand implements BCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 객체 선언 후 
		
		//String bId = request.getParameter("bId");
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		BDAO dao = new BDAO();
		BDTO dto = dao.contentView(bId);
		
		request.setAttribute("content_view", dto);
		
		
	}

}
