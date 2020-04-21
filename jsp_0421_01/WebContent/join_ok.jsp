<%@page import="com.javalec.ex.B_memberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.javalec.ex.B_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mdto" class="com.javalec.ex.B_memberDTO" />    
<jsp:setProperty property="*" name="mdto"/>

<%
	// 현재 시간을 자바에서 입력
	// mdto.setB_date(new Timestamp(System.currentTimeMillis()));
	
	B_memberDAO mdao = B_memberDAO.getInstance(); //싱글톤 패턴

	int check = mdao.confirmId(mdto.getId());
	if(check == 1) {
		// 아이디가 있을 경우
%>	
		<script type="text/javascript">
			alert("아이디가 존재합니다 다시 입력해 주세요.");
			history.back();
		</script>
	
<%	
	}
	else {
		// 아이디가 없을 경우
		int ch = mdao.insertMember(mdto);
		
		if(ch == 1) {
			// 데이터 저장 완료
%>
			<script type="text/javascript">
				alert("회원가입이 완료 되었습니다.\n로그인 페이지로 이동합니다.");
				location.href="login.jsp";
			</script>	

<%			
		}
		else {
			// 데이터 저장 실패
%>
			<script type="text/javascript">
				alert("데이터 저장 실패! 다시 입력해 주세요.");
				history.back();
			</script>
<% 
		}
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - 회원관리 프로그램(join_ok)</title>
		
	</head>
	<body>
	
	</body>
</html>