<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="ldto" class="com.javalec.ex.MemberInfo" scope="page" />
<jsp:setProperty property="*" name="ldto"/>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - EL 태그, 내장 객체</title>
	</head>
	<body>
		<h2> 스크립트릿 태그 </h2>
		<% 
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
		
		%>
		
		이름 : <%= name %> <br/>
		아이디 : <%= id %> <br/>
		패스워드 : <%= pw %> <br/>
		
		<p> ============================================= </p>
		
		<h2> EL 태그 사용 </h2>
		<h4> userBean 사용시 </h4>
		
		이름 : ${ldto.name } <br/>
		아이디 : ${ldto.id } <br/>
		패스워드 : ${ldto.pw } <br/>
		
		<p> --------------------------------------------- </p>
		
		<h4> userBean 사용안할 시 </h4>
		
		이름 : ${param.name } <br/>
		아이디 : ${param.id } <br/>
		패스워드 : ${param.pw } <br/>
		 
		<p> ============================================= </p>
		
		<h2> 내장 객체 </h2>
		
		applicationScope : ${applicationScope.appUser_id }<br/>
		sessionScope : ${sessionScope.sessUser_id }<br/>
		
		<!-- 아래 두개는 페이지가 넘어가면 사라지기 때문에 출력이 되지 않는다. -->
		pageScope : ${pageScope.pageUser_id }<br/>
		requestScope : ${requestScope.requser_id }<br/>
		
		 
	</body>
</html>