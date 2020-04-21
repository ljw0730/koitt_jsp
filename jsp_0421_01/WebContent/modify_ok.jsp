<%@page import="com.javalec.ex.B_memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="com.javalec.ex.B_memberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
 
<%
// 	String id = mdto.getId();
 	B_memberDAO mdao = B_memberDAO.getInstance();
 	int check = mdao.updateMember(mdto);
 
 	if(check == 1) {
 		// 저장 성공
%>
		<script type="text/javascript">
			alert("회원정보 수정이 완료 되었습니다.");
			location.href="main.jsp";
		</script>
<% 		
 	}
 	else {
 		// 저장 실패
%>
		<script type="text/javascript">
			alert("회원정보수정이 잘못되었습니다.\n다시 수정해 주세요.");
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