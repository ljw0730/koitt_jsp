package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S_ok")
public class Script_ok_ex0416_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Script_ok_ex0416_01() {
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
	
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		String str;
		str="<script type=\"text/javascript\">\r\n" + 
		     "alert(\"아이디,패스워드가 잘못되었습니다. 다시 입력해주세요.\");\r\n" + 
		     "location.href='ex0416_01_script_link.html';\r\n" + 
		     "</script>";
		// \r\n => 단락을 나눈다.
		PrintWriter writer = response.getWriter();
		writer.println("<html><head></head><body>");
		writer.println(str);
		writer.println("</body></html>");
		writer.close();
		
		
		// 이것두 됨.
		//	response.setCharacterEncoding("UTF-8");
		//	
		//	response.setContentType("text/html; charset=UTF-8");
		//	PrintWriter writer = response.getWriter();
		//	writer.println("<html>");
		//	writer.println("<head>");
		//	writer.println("<title>서블릿 스크립트 테스트</title>");
		//	writer.println("<meta charset='UTF-8'>");
		//	writer.println("</head>");
		//	writer.println("<body>");
		//	writer.println("<script>alert('데이터가 잘못 입력되었습니다.\\n 다시 입력해 주세요.');");
		//	writer.println("history.back(-1);</script>");
		//	//writer.println("location.href('index.jsp');");
		//	writer.println("</body>");
		//	writer.println("</html>");
		//	writer.close();
		
		// 이상하게 
		// writer.println("<script>alert('데이터가 잘못 입력되었습니다.\\n 다시 입력해 주세요.');");
		// writer.println("history.back(-1);</script>");
		// 은 되는데
		// writer.println("<script>");
		// writer.println("alert('데이터가 잘못 입력되었습니다.\\n 다시 입력해 주세요.');");
		// writer.println("history.back(-1);");
		// writer.println("</script>");
		// 는 안된다.	
		
	}

}
