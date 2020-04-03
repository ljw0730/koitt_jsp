<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - include 지시자</title>
		<style type="text/css">
			div {
				width: 100%;
				height: 160;
				margin: 0 auto;
				border: 1px solid black;
			}
			
			ul {
				width: 1500px;
				list-style-type: none;
			}
			
			li {
				width: 250px;
				font-size: 20px;
				text-align: center;
				float: left;
				
				border: 1px solid black; 			
			}
		
		</style>
	</head>
	<body>
		<div>
			<%@ include file="menu.jsp" %>
		</div>
		<div>
			<p>main의 내용이 들어가는 부분</p>
		</div>
	</body>
</html>