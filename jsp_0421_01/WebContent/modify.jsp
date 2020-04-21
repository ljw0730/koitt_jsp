<%@page import="com.javalec.ex.B_memberDAO"%>
<%@page import="com.javalec.ex.B_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String id = request.getParameter("id");
 	B_memberDAO mdao = B_memberDAO.getInstance();
 	B_memberDTO mdto = mdao.getB_member(id);
 
 
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - 회원관리 프로그램(회원정보수정))</title>
		<script type="text/javascript" src="js/custom.js" ></script>
	</head>
	<body>
		<h2> 회원정보 수정 </h2>
		<form action="modify_ok.jsp" name="modify_form" method="post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%= mdto.getId() %>" readonly/> <br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" value="<%= mdto.getPw() %>"/> <br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%= mdto.getName() %>"/> <br/>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" value="<%= mdto.getEmail() %>"/> <br/>
			<label for="address">주소</label>
			<input type="text" name="address" id="address" value="<%= mdto.getAddress() %>"/> <br/>
			
			<input type="button" onclick="modify_check()" value="회원정보수정" />
			<input type="button" onclick="javascript:history.back()" value="취소" />
			<input type="button" onclick="delete_check()" value="회원정보삭제" />
		</form>	
	</body>
</html>