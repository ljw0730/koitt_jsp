<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// 세션을 받을 변수
	String user_id;
	String user_name;
	String auth_user;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 회원가입 연습 (NAVER main - login 공간)</title>
		<style type="text/css">
			a {
				text-decoration: none;
				color: #666;
			}
			#section_login {
				width: 332px; height: 120px;
				font-size: 12px;
				color: #666;
				box-sizing : border-box;
				margin: 30px auto;
				padding : 15px 25px;
				border: 1px solid #dee3eb;				
			}
			#section_login p {
				margin: 0;
			}
			#login_btn {
				width: 280px; height: 37px;
				text-align: center;
				font-size: 15px;
				color: #fff;
				display: block;
				box-sizing : border-box;
				margin-top : 15px;
				padding-top: 8px;
				background-color: #03c75a;
				border: 1px solid #03c75a;
			}
			#lg_link {
				margin-top: 10px;
			}
			#join {
				float: right;
			}
			
			#user_info {
				width: 332px; height: 83px;
				font-size: 12px;
				color: #666;
				box-sizing : border-box;
				margin: 30px auto;
				padding : 15px 25px;
				border: 1px solid #dee3eb;
			}
			#user_info strong {
				font-size: 20px;
			}
			
			.loging_btn {
				float: right;
				width: 80px; height: 24px;
				text-align: center;
				line-height : 22px;
				border: 1px solid #dee3eb;
			}
		</style>
	</head>
	<body>
	<%
		auth_user = (String)session.getAttribute("auth_user");
		user_id = (String)session.getAttribute("user_id");
		user_name = (String)session.getAttribute("user_name");
		if(auth_user == null) {
			// 로그인 안된 페이지
	%>
			<!-- 로그인 안되었을 때 -->
			<div id="section_login">
				<p>네이버를 더 안전하고 편리하게 이용하세요.
				<a href="ex0414_01_login.html" id="login_btn" >NAVER 로그인</a>
				<div id="lg_link">
					<a id="join" href="ex0414_01_join.html">회원가입</a>
					<span><a href="#">아이디</a></span>
					<span> / </span>
					<span><a href="#">비밀번호 찾기</a></span>			
				</div>
			</div>
	<% 
		}
		else {
			// 로그인 된 페이지
	%>
			<!-- 로그인 되었을 때  -->
			<div id="user_info">
				<strong><a href="#"><%= user_name %> 님</a></strong>
				<a href="ex0414_01_logout.jsp" class="loging_btn" id="logout_btn"> 로그 아웃</a>
				<a href="ex0414_01_modify.jsp" class="loging_btn" id="modify_btn"> 회원정보수정</a>
			</div>
	<% 		
		}
	%>
	
	</body>
</html>