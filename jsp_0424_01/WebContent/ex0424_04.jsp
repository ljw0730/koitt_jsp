<%@page import="com.javalec.ex.Bcon.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기본객체 request로 값 넘기기</title>
	</head>
	<body>
		<%
		
			// 변수 request로 넘기기
			
			request.setAttribute("user_id", "admin");
			request.setAttribute("user_pw", "1234");
			request.setAttribute("user_name", "홍길동");
			
			//////////////////////////////////////////////////////////
			
			// Class 1개 request로 넘기기
			
			LoginDTO lo1 = new LoginDTO(90, "naver", "12345");
			request.setAttribute("ldto", lo1);
			
			//////////////////////////////////////////////////////////
			
			
			// ArrayList request로 넘기기
			
			ArrayList list = new ArrayList();
			
			LoginDTO log = null;
			for(int i = 0; i < 5; i++) {
				log = new LoginDTO();
				log.setNum(i+1);
				log.setId("admin" + i);
				log.setPw("abc"+i);
				list.add(log);
			}
			
			request.setAttribute("test", list);
			
			//////////////////////////////////////////////////////////
			
			// response.sendRedirect("ex0424_04_result.jsp"); 로 페이지를 넘기게 되면
			// 페이지가 넘어가면서 request 값은 사라진다. 따라서 null 값이 나온다.
			
			// 페이지를 넘겼음에도 request 값을 살리려면 RequestDispatche를 사용해야한다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("ex0424_04_result.jsp");
			dispatcher.forward(request, response);
		%>
	</body>
</html>