package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;
import com.javalec.ex.BDTO.BDTO;

public class BListcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 객체 선언 후 메소드 호출
		BDAO dao = new BDAO();
		
		ArrayList<BDTO> dtos = dao.list();
		
		request.setAttribute("list", dtos);
		
	}

}
