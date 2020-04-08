<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 404 에러 페이지</title>
		<style type="text/css">
			* { 
				margin: 0;
				padding: 0;
			}
			div {
				width: 800px;
				margin: 50px auto;
			}
			img {
				width: 700px;
			}
		
		</style>
		
	</head>
	<body>
		<div>
			<p>404 페이지 오류</p>
			<a href=""><img alt="404 에러 메시지" src="img/error_404.jpg" /></a>
			<%= exception.getMessage() %>
			
		</div>
	</body>
</html>