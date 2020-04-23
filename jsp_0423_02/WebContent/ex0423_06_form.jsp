<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		<form action="ex0423_06.jsp" name="score" method="post">
			<label for="name">이름 : </label>
			<input type="text" name="name" id="name" /><br/>
			<label for="kor">국어점수 : </label>
			<input type="text" name="kor" id="kor" /><br/>
			<label for="eng">영어점수 : </label>
			<input type="text" name="eng" id="eng" /><br/>
			<label for="math">수학점수 : </label>
			<input type="text" name="math" id="math" /><br/>
			
			<input type="submit" value="학점 보기" />
		
		</form>
		
	</body>
</html>