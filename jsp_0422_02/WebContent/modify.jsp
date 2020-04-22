<%@page import="com.jabalec.ex.BoardDTO"%>
<%@page import="com.jabalec.ex.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_num = Integer.parseInt(request.getParameter("b_num"));

	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO bdto = bdao.getBoard(b_num);
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드(수정 및 삭제)</title>
	</head>
	<body>
		<form action="modify_ok.jsp" name="modify_form" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="b_num" value="<%= bdto.getB_num() %>" />
			<label for="b_title">제목</label>
			<input type="text" name="b_title" id="b_title" value="<%= bdto.getB_title() %>"/> <br/>
			<label for="b_user">작성자</label>
			<input type="text" name="b_user" id="b_user" value="<%= bdto.getB_user() %>" readonly/> <br/>
			<label for="b_content">내용</label><br/>
			<!-- 
			<input type="text" name="b_content" id="b_content" /> <br/>
			 -->
			<textarea rows="10" cols="40" name="b_content" id="b_content" ><%= bdto.getB_content() %></textarea>
			<br/>
			<label for="old_file">기존파일</label>
			<input type="text" name="olo_file" id="old_file" value="<%= bdto.getB_file() %>" readonly/> <br/>
			<label for="file">파일 첨부</label>
			<input type="file" name="file" id="file" /> <br/>
						
			<input type="submit" value="수정완료" />
		</form> 
	</body>
</html>