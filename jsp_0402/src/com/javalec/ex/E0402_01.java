package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@WebServlet("/E01")
public class E0402_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public E0402_01() {
    
    }
    
    // 선처리
    @PostConstruct
    public void postConstruct() {
    	System.out.println("선처리!");
    	System.out.println("@PostConstruct postConstruct() - init() 메소드보다 먼저 실행됨.");
    }

    // 후처리
    @PreDestroy
    public void preDestroy() {
		System.out.println("후처리!");
		System.out.println("preDestroy() - destroy() 메소드 보다 나중에 실행됨.");
	}
    
    @Override
    public void init() throws ServletException {
    	System.out.println("Servlet 생성 시 최초 한번 init() 메소드가 실행");
    	System.out.println("최초 실행 시 Servlet에서 처리해야 할 구문이 있다면 여기에 입력.");
    }
    
    @Override
    public void destroy() {
    	System.out.println("Servlet 종료 시 최초 한번 destroy() 메소드가 실행");
    	System.out.println("종료 시 Servlet에서 처리해야 할 구문이 있다면 여기에 입력.");
    }
    
    // 주소로 바로 접근하게 되면 doGet() 실행, method="get" 일 경우 doGet() 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("콘솔창에 doGet() 글쓰기");

		actionDo(request, response);
		
	}
	
	// method="post" 일 경우 doPost() 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("콘솔창에 doPost() 글쓰기");
		
		request.setCharacterEncoding("UTF-8");
		
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("콘솔창에 actionDo() 호출됨");
		
		// form에서 id, pw, name 데이터 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String[] hobby = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String address = request.getParameter("address");
		
		// 이 아래로는 utf-8의 html을 작성할것이다.
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet 회원정보 연습</title>");
		writer.println("<style>p{font-size:20px; color:red;}</style>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<p>안녕하세요.</p>");
		writer.println("<p>" + name + "님 반갑습니다..~~</p>");
		writer.println("<p>아이디 : " + id + "</p>");
		writer.println("<p>패스워드 : " + pw + "</p>");
		writer.println("<p>취미 : " + Arrays.toString(hobby) + "</p>");
		writer.println("<p>전공 : " + major + "</p>");
		writer.println("<p>주소 : " + address + "</p>");
		
		writer.print("<p>취미 : ");		
		for(int i = 0; i < hobby.length; i++) {
			if(hobby[i].equals("book")) {
				writer.print("독서");
			}
			else if (hobby[i].equals("cook")) {
				writer.print("요리");
			}
			else if (hobby[i].equals("run")) {
				writer.print("조깅");
			}
			else if (hobby[i].equals("swim")) {
				writer.print("수영");
			}
			
			if(i != (hobby.length-1)) {
				writer.print(", ");
			}
		}
		writer.print("</p>");
		
		writer.print("<p>전공 : ");		
		if(major.equals("kor")) {
			writer.print("국어국문학과");
		}
		else if (major.equals("eng")) {
			writer.print("영어영문학과");
		}
		else if (major.equals("math")) {
			writer.print("수학과");
		}
		else if (major.equals("design")) {
			writer.print("디자인과");
		}
		writer.print("</p>");
		
		writer.print("<p>주소 : ");		
		if(address.equals("seoul")) {
			writer.print("서울");
		}
		else if (address.equals("gyeonggi")) {
			writer.print("경기");
		}
		else if (address.equals("incheon")) {
			writer.print("인천");
		}
		writer.print("</p>");
		
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}

}
