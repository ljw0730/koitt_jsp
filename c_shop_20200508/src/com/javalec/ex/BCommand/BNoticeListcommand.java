package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.Notice_BDAO;
import com.javalec.ex.DTO.Notice_BDTO;

public class BNoticeListcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int page = 1;	// 최초 기본 1페이지 셋팅
		int limit = 10;	// 한페이지 나오는 게시글 10개
		
		// 넘어온 page가 있을때 예) 현재 4페이지 -> page = 4;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String searchflag = request.getParameter("searchflag"); // 검색체크
		String opt = request.getParameter("opt"); // 전체, 제목, 내용
		String search = request.getParameter("search"); // 검색어
		
		System.out.println("opt : " + opt);
		System.out.println("search : " + search);
		
		if(opt == null) {
			opt = "";
		}
		if(search == null) {
			search = "";
		}
		
		
		Notice_BDAO nbdao = Notice_BDAO.getInstance();
		ArrayList<Notice_BDTO> nbdtos = nbdao.notice_list(page, limit, opt, search);
		
		// 전체 게시글 count(*)
		int listcount = nbdao.getlistcount(opt, search);
		
		// 최대 페이지수
		int maxpage = (int)((double)listcount/limit+0.95);
		
		// 처음페에지
		int startpage = ((int)((double)page/10+0.9)-1)*10+1;
		
		//마지막 페이지
		int endpage = maxpage;	//1~10 까지는 maxpage가 endpage가 됨.
		if(endpage > startpage+10-1) {
			endpage = startpage+10-1;
		}
		
		request.setAttribute("nbdtos", nbdtos);
		
		request.setAttribute("listcount", listcount);
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		if(search != "") {
			searchflag = "1";
			request.setAttribute("searchflag", searchflag);
			request.setAttribute("opt", opt);
			request.setAttribute("search", search);
		}
		
		System.out.println("listcount : " + listcount);
		System.out.println("page : " + page);
		System.out.println("maxpage : " + maxpage);
		System.out.println("startpage : " + startpage);
		System.out.println("endpage : " + endpage);
	}

	
	
}
