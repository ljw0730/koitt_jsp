<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드</title>
	</head>
	<body>
		<!-- enctype="multipart/form-data" 를 적어주어야 업로드가 가능하다 -->
		<form action="upload_form_ok.jsp" name="form" method="post" enctype="multipart/form-data">
			<label for="b_num">번호</label>
			<input type="text" name="b_num" id="b_num" /> <br/>
			<label for="b_title">제목</label>
			<input type="text" name="b_title" id="b_title" /> <br/>
			<label for="b_content">내용</label>
			<input type="text" name="b_content" id="b_content" /> <br/>
			<label for="b_writer">작성자</label>
			<input type="text" name="b_writer" id="b_writer" /> <br/>
			<label for="file">파일 첨부1</label>
			<input type="file" name="file" id="file" /> <br/>
			<label for="file2">파일 첨부2</label>
			<input type="file" name="file2" id="file2" /> <br/>
			
			<input type="submit" value="저장" />
		
		</form>
	
	</body>
</html>