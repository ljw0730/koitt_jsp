package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Event_BDAO;
import com.javalec.ex.DTO.Event_BDTO;

public class EEventContentViewcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int eId = Integer.parseInt(request.getParameter("eId"));
		
		Event_BDAO ebdao = Event_BDAO.getInstance();
		Event_BDTO ebdto = ebdao.eventContentView(eId);
		
		request.setAttribute("ebdto", ebdto);
	}

}
