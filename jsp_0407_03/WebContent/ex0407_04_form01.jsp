<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>JSP - session form</title>
		</head>
	<body>
		<h2>세션 만들기</h2>
		<form action="ex0407_04_form02.jsp" name="session_form" method="get">
			<label for="name1">name1</label>
			<input type="text" name="name1" id="name1" /><br/>
			<label for="value1">value1</label>
			<input type="text" name="value1" id="value1" /><br/><br/>
			
			<label for="name2">name2</label>
			<input type="text" name="name2" id="name2" /><br/>
			<label for="value2">value2</label>
			<input type="text" name="value2" id="value2" /><br/>
			
			<input type="submit" value="저장" />
		</form>
		
	</body>
</html>