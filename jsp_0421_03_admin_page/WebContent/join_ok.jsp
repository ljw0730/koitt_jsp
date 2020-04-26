<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mdto" class="com.javalec.ex.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%
	MemberDAO mdao = MemberDAO.getInstance();
	int check = mdao.insertMember(mdto);

	if(check == 1) {
		// 저장 성공
%>
		<script>
			alert("회원가입이 완료 되었습니다.\n 로그인 화면으로 이동합니다.");
			location.href="login.jsp";
		</script>
<% 		
	}
	else if(check == 0) {
		// 저장 실패
%>
		<script>
			alert("데이터 저장 실패 했습니다. 다시 입력해 주세요.");
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