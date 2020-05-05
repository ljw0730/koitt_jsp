package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDAO.BDAO;
import com.javalec.ex.BDTO.BDTO;

public class BListcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page=1;		// 최초기본 1페이지 셋팅
		int limit=10;	// 1page = 게시글 10개
		
		// 넘어온 page가 있을때 예) 현재 4페이지 -> page = 4;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
			
		BDAO bdao = new BDAO();
		// 페이지별 리스트 개수 가져오기
		ArrayList<BDTO> list = bdao.list(page, limit);
		
		// 전체 게시글 count(*)
		int listcount = bdao.getlistCount();
		
		// 최대 페이지수 
		int maxpage = (int)((double)listcount/limit+0.95);
				
		//처음페이지
		int startpage = ((int)((double)page/10+0.9)-1)*10+1;
				
		//마지막페이지
		int endpage = maxpage;	// 1~10까지는 maxpage가 endpage가 됨.
		if(endpage>startpage+10-1) {
			endpage = startpage+10-1;
		}
		
		
		request.setAttribute("bdtos", list);
		request.setAttribute("listcount", listcount);
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		System.out.println("listcount : " + listcount);
		System.out.println("page : " + page);
		System.out.println("maxpage : " + maxpage);
		System.out.println("startpage : " + startpage);
		System.out.println("endpage : " + endpage);
		
		
		
		
		
		
	}

}
