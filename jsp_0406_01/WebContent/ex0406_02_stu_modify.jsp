<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>학생 성적 수정</title>
	</head>
	<body>
		
		<h1>학생 성적 수정 폼</h1>
		<form action="ex0406_02_stu_insert.jsp" name="inform" method="get">
			
			<label for="s_num">학번</label>
			<input type="text" name="s_num" id="s_num" value="<%= request.getParameter("s_num") %>"/><br/>
			<label for="s_name">이름</label>
			<input type="text" name="s_name" id="s_name" value="<%= request.getParameter("s_name") %>"/><br/>
			<label for="s_kor">국어</label>
			<input type="text" name="s_kor" id="s_kor" value="<%= request.getParameter("s_kor") %>"/><br/>
			<label for="s_eng">영어</label>
			<input type="text" name="s_eng" id="s_eng" value="<%= request.getParameter("s_eng") %>"/><br/>
			<label for="s_math">수학</label>
			<input type="text" name="s_math" id="s_math" value="<%= request.getParameter("s_math") %>"/><br/>
			
			<input type="submit" value="저장" />
			<input type="reset" value="취소"/> <br/>
		
		</form>
		
		
	</body>
</html>