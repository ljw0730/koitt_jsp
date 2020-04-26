<%@page import="com.javalec.ex.MemberDTO"%>
<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO mdao = MemberDAO.getInstance();
	int check = mdao.userCheck(id, pw);

	if(check == 1) {
		// 아이디, 비밀번호 일치 

		MemberDTO mdto = mdao.getMember(id);
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", mdto.getName());
		session.setAttribute("auth_user", id);
		
		response.sendRedirect("main.jsp");
		
	}
	else if(check == 0) {
		// 아이디 일치, 비밀번호 불일치
%>
		<script>
			alert("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
			history.back();
		</script>
<% 		
	}
	else if(check == -1){
		// 아이디가 없음
%>
		<script>
			alert("아이디가 존재하지 않습니다. 다시 입력해 주세요.");
			history.back();
		</script>
<%
	}
%>    
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>