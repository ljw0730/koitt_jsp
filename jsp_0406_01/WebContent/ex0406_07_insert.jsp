<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 쿠키 입력 연습</title>
	</head>
	<body>
		<h2>만들고 싶은 쿠키</h2>
		
		<form action="ex0406_07_check.jsp">
			<label for="c_name">cookie name</label>
			<input type="text" name="c_name" id="c_name" /><br/>
			<label for="c_value">cookie value</label>
			<input type="text" name="c_value" id="c_value" /><br/>
			
			<input type="submit" value="쿠키 저장" />
		</form>
		
		
	</body>
</html>