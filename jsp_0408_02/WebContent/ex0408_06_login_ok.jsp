<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem1" class="com.javalec.ex.Member" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// 원래는 DB를 id, pw 가지과 와서 비교
			if(id.equals(mem1.getJ_id()) && pw.equals(mem1.getJ_pw())) {
				//세션 추가
				session.setAttribute("auth_User", id);
				session.setAttribute("nick_Name", mem1.getJ_nickName());
				response.sendRedirect("ex0408_06_index.jsp");
			}
			else {
		%>
				<script type="text/javascript">
					alert("아이디, 패스워드가 잘못되었습니다. 다시 입력해 주세요.");
					// 한 페이지 뒤로 가라.
					history.back(-1);
				</script>
		<%
				//response.sendRedirect("ex0408_01_login.html");
			}
		%>
	
	
	
	</body>
</html>