<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 연습 (NAVER main - login 공간)</title>
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
				margin: 0 auto;
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
		</style>
	</head>
	<body>
	
		<div id="section_login">
			<p>네이버를 더 안전하고 편리하게 이용하세요.
			<a id="login_btn" href="ex0407_02_login.html">NAVER 로그인</a>
			<div id="lg_link">
				<a id="join" href="#">회원가입</a>
				<span><a href="#">아이디</a></span>
				<span> / </span>
				<span><a href="#">비밀번호 찾기</a></span>			
			</div>
		</div>
	
	
	</body>
</html>