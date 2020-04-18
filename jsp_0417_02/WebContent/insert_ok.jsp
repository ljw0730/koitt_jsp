<%@page import="com.javalec.ex.Member3DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	String id;
	String pw;
	String name;
	String email;
	String address;
	String phone;
	String birth;
	String gender;
	String news;
	String sms;
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - insert_ok</title>
	</head>
	<body>
	<!--  데이터 입력된 값을 모두 메소드로 전송 -->
	<!--  리턴값 체크해서 1이면 저장완료 0이면 저장이 안되었음 -->
		
	<%
	
		int check;
	
		Member3DAO m3dao = new Member3DAO();
		
		request.setCharacterEncoding("UTF-8");
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		email = request.getParameter("email");
		address = request.getParameter("address");
		phone = request.getParameter("phone");
		birth = request.getParameter("birth");
		gender = request.getParameter("gender");
		news = request.getParameter("news");
		sms = request.getParameter("sms");
	
		check = m3dao.member_insert(id, pw, name, email, address, phone, birth, gender, news, sms);
	
		if(check == 1) {
	%>
			<script type="text/javascript">
				alert("저장되었습니다.");
			</script>
	<%
			response.sendRedirect("m3_select.jsp");
		}
		else {
	%>
			<script type="text/javascript">
				alert("저장에 실패했습니다.");
				history.back(-1);
			</script>
	<%	
		}
	%>	
	
	
	
	<!-- 입력이 되었으면 m3_slect.jsp 리다이렉트 -->
	
	</body>
</html>