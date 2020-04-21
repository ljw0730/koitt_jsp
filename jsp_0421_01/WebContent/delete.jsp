<%@page import="com.javalec.ex.B_memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	B_memberDAO mdao = B_memberDAO.getInstance();
	
	int check = mdao.deleteMember(id);
	
	if(check == 1) {
		// 삭제 성공	
%>
		<script type="text/javascript">
			alert("삭제가 완료 되었습니다.");
			location.href="main.jsp";
		</script>
<%		
	}
	else {
		// 삭제 실패
%>
		<script type="text/javascript">
			alert("삭제가 되지 않았습니다. 다시 시도해 주세요.");
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