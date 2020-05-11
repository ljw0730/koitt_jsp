<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
	
	String id = request.getParameter("id");
	String check = request.getParameter("check");

	if(id == null) {
		id = "";
	}
	if(check == null) {
		check = "";
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 중복 체크</title>
		<script type="text/javascript" src="js/script_join02_info_input.js"></script>
	</head>
	<body>
		<form action="join02_id_overlap_check_ok.jsp" name="id_obverlab_check_form" method="post">
			<label>아이디</label>
			<input type="text" name="ch_id" id="ch_id" value="<%= id %>"/>
			<input type="button" value="아이디 중복 체크" onclick="id_overlap_check()" /><br/>
			<p>아이디는 3자이상, 영문 소문자, 대문자, 숫자만 입력 가능합니다.</p>
			
			<% 
				if(check.equals("1")) {
					//아이디 중복
			%>
				<p class="ch_text">중복된 아이디 입니다. 다시 입력해 주세요.</p>			
			<% 	
				} else if(check.equals("0")) {
					//아이디 중복X. 사용가능
			%>
				<p class="ch_text">사용가능한 아이디 입니다.</p>
				<br/>
			
				<input type="button" value="아이디 사용하기" onclick="join_id_input()" />
			<%		
				}
			%>
			
		
		
		</form>
		
	</body>
</html>