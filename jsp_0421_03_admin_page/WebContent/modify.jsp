<%@page import="com.javalec.ex.MemberDTO"%>
<%@page import="com.javalec.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("auth_user") == null) {
%>
		<script>
			alert("로그인을 하지 않았습니다. 로그인을 해주세요.");
			location.href="login.jsp";
		</script>
<%
	}
	
	String id = request.getParameter("id");
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO mdto = mdao.getMember(id);

%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 커넥션 풀 연습 - 회원관리 프로그램(회원정보수정))</title>
		<script type="text/javascript" src="js/custom.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style type="text/css">
			#address2, #address3 {
				width: 300px;
			}
		
		</style>
	</head>
	<body>
		<h2> 회원정보수정 </h2>
		<form action="modify_ok.jsp" name="modify" method="post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%= mdto.getId() %>"readonly/> <br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" value="<%= mdto.getPw() %>"/> <br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%= mdto.getName() %>"/> <br/>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" value="<%= mdto.getEmail() %>"/> <br/>
			<label for="address1">주소</label> <br/>
			<input type="text" name="address1" id="address1" value="<%= mdto.getAddress1() %>" readonly />
			<input type="button" value="주소번호검색" id="address_btn" onclick="openDaumZipAddress()"/>
			<br/>
			<input type="text" name="address2" id="address2" value="<%= mdto.getAddress2() %>" readonly/> <br/>
			<input type="text" name="address3" id="address3" value="<%= mdto.getAddress3() %>" placeholder="상세주소를 입력해 주세요."/> <br/> 
			
			<input type="button" onclick="modify_check()" value="회원정보수정" />
			<input type="button" onclick="javascript:location.href='main.jsp''" value="취소" />
			<input type="button" onclick="delete_check()" value="회원정보삭제" />
			
		
		
		</form>
	</body>
</html>