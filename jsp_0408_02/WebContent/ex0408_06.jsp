<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mem1" class="com.javalec.ex.Member" scope="session"/>
<jsp:setProperty name="mem1" property="*" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - bean 연습 - form으로부터 온 데이터 받기/출력</title>
	</head>
	<body>
		이름 : <%= mem1.getJ_name() %><br/>
		닉네임 : <%= mem1.getJ_nickName() %><br/>
		아이디 : <%= mem1.getJ_id() %><br/>
		비밀번호 : <%= mem1.getJ_pw() %><br/>
		성별 : <%= mem1.getJ_gender() %><br/>
		직업 : <%= mem1.getJ_job() %><br/>
		<!-- 배열 출력 하기 -->
		취미 : <%= Arrays.toString(mem1.getJ_hobby()) %><br/>
		
		<%
			String[] job = mem1.getJ_hobby();
			for(int i = 0; i < job.length; i++) {
				out.println(job[i] + ", ");
			}
		
		
		
		%>
		<br/>
		<a href="ex0408_06_index.jsp">메인으로</a>
		
	</body>
</html>