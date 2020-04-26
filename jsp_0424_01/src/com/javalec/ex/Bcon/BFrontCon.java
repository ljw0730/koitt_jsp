package com.javalec.ex.Bcon;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.MemberDAO;
import com.javalec.ex.DTO.MemberDTO;

@WebServlet("*.do")
public class BFrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFrontCon() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 들어옴");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 들어옴");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo 들어옴");
		
		request.setCharacterEncoding("UTF-8");
		
		// 페이지 이동에 사용하는 변수
		String viewPage = null;
		
		// 만약에 주소가 http://localhost:8181/jsp_0424_01/insert 라고 치면
		// url : http://localhost:8181/jsp_0424_01/insert
		// uri : /jsp_0424_01/insert
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		
		// ContextPath : 프로젝트 명 = > jsp_0424_01
		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);
		
		// 파일명 => /insert 
		String com = uri.substring(conPath.length());
		System.out.println("com : " + com);
		
		if(com.equals("/insert.do")) {
			System.out.println("insert 페이지를 요청하였습니다.");
			
			
			// DAO 메소드 호출해서 값을 받아서 request.setAttrubute
			request.setAttribute("insert_address", com);
			
			//insert.jsp로 forwarding
			viewPage="ex0424_05_insert.jsp";
		}
		else if(com.equals("/update.do")) {
			System.out.println("update 페이지를 요청하였습니다.");
			
			// DAO 메소드 호출해서 값을 받아서 request.setAttrubute
			request.setAttribute("update_address", com);
			
			//update.jsp로 forwarding
			viewPage="ex0424_05_update.jsp";
		}
		else if(com.equals("/select.do")) {
			System.out.println("select 페이지를 요청하였습니다.");
			
			// DAO 메소드 호출해서 값을 받아서 request.setAttrubute
			
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			MemberDAO mdao = MemberDAO.getInstance();
			list = mdao.getMembers();
			request.setAttribute("dtos", list);
			request.setAttribute("select_address", com);
			
			//select.jsp로 forwarding
			viewPage="ex0424_05_select.jsp";
		}
		else if(com.equals("/delete.do")) {
			System.out.println("delete 페이지를 요청하였습니다.");
			
			
			// DAO 메소드 호출해서 값을 받아서 request.setAttrubute
			request.setAttribute("delete_address", com);
			
			//delete.jsp로 forwarding
			viewPage="ex0424_05_delete.jsp";
		}
		
		RequestDispatcher disPatcher = request.getRequestDispatcher(viewPage);
		disPatcher.forward(request, response);
	}

}


