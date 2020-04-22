<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드(게시판 모양)</title>
	</head>
	<body>
		<form action="upload_form_ok.jsp" name="form" method="post" enctype="multipart/form-data" >
			<label for="b_title">제목</label>
			<input type="text" name="b_title" id="b_title" /> <br/>
			<label for="b_user">작성자</label>
			<input type="text" name="b_user" id="b_user" /> <br/>
			<label for="b_content">내용</label><br/>
			<!-- 
			<input type="text" name="b_content" id="b_content" /> <br/>
			 -->
			<textarea rows="10" cols="40" name="b_content" id="b_content"></textarea>
			<br/>
			<label for="file">파일 첨부</label>
			<input type="file" name="file" id="file" /> <br/>
						
			<input type="submit" value="저장" />
		</form> 
	</body>
</html>