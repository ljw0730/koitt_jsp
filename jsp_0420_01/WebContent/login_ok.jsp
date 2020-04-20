<%@page import="com.javalec.ex.B_memberDTO"%>
<%@page import="com.javalec.ex.B_memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request로 넘어온 데이터 한글처리
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// B_memberDAO mdao = new B_memberDAO();
	B_memberDAO mdao = B_memberDAO.getInstance();
	int check = mdao.userCheck(id, pw); // 리턴값 1 - 성공, 0 - 비밀번호 불일치, -1 - ID 없음
	
	if(check == -1) {
%>
		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다. 다시 입력해 주세요.");
			history.back();
		</script>
		
<%		
	}
	else if (check == 0) {
%>
		<script type="text/javascript">
			alert("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
			history.back();
		</script>
<%		
	}
	else if (check == 1) {
%>
		<!-- 닉네임을 가져와야 하는 경우 -->
<%	
		B_memberDTO mdto = mdao.getB_member(id);		

		// 새션에 집어 넣을것들 : id, pw, name, auth_user
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", mdto.getName());
		session.setAttribute("auth_user", id);
		
		response.sendRedirect("main.jsp");
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