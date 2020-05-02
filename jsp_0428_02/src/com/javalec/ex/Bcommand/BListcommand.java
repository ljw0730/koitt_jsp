package com.javalec.ex.Bcommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;
import com.javalec.ex.BDTO.BDTO;

public class BListcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		BDAO bdao = BDAO.getInstance();
		ArrayList<BDTO> bdots = bdao.list();
		
		request.setAttribute("bdtos", bdots);
	}

}
