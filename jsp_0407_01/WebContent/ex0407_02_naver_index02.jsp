<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 연습 (NAVER login 상태)</title>
		<style type="text/css">
			a {
				text-decoration: none;
				color: #666;
			}
			#user_info {
				width: 332px; height: 83px;
				font-size: 12px;
				color: #666;
				box-sizing : border-box;
				margin: 0 auto;
				padding : 15px 25px;
				border: 1px solid #dee3eb;
			}
			#user_info strong {
				font-size: 20px;
			}
			
			#logout_btn {
				float: right;
				width: 70px; height: 24px;
				text-align: center;
				line-height : 22px;
				border: 1px solid #dee3eb;
			}
		
		</style>
		
	</head>
	<body>
		<%! String naver_user; %>
		<%
			// 혹시나 user가 ex0407_02_naver_index02.jsp로
			// 바로 접근하게 되면 페이지가 열리지 않도록 함.
			Cookie[] cookies = request.getCookies();
			for(int i = 0; i < cookies.length; i++) {
				String c_check = cookies[i].getName();
				if(c_check.equals("naver_user")) {
					naver_user = cookies[i].getValue();
					break;	
				}
				else {
					naver_user = null;
				}
			}
			
			if(naver_user == null) {
				response.sendRedirect("ex0407_02_login.html");
			}
		%>
	
		<div id="user_info">
			<strong><a href="#"><%= naver_user %> 님</a></strong>
			<a href="ex0407_02_logout.jsp" id="logout_btn"> 로그 아웃</a>
		</div>
	</body>
</html>