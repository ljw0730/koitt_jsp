<%@page import="com.jabalec.ex.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jabalec.ex.BoardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO bdao = BoardDAO.getInstance();

	int b_num = 0;
	String b_title = "";
	String b_content = "";
	String b_user = "";
	
	// 파일 저장 경로 지정
	String path = request.getRealPath("upload");
	
	// 파일 사이즈 - 업로드 파일 용량 제한
	int size = 1024 * 1024 * 10; //10Mbyte 용량 제한
	//1024 - Kbyte, 1024*1024 - Mbyte
	
	// 파일 원래 이름
	String orifile = "";
	// 파일 이름 최종 설정(같은 이름의 파일이 업로드 된 경우 최종적으로 파일 이름을 변경해 준다.)
	String file ="";
	
	try {
		
		// request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
		MultipartRequest multi = 
			new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		// DefaultFileRenamePolicy() : 똑같은 이름의 파일이 업로드 되면 뒤에 1, 2, 3, ... 을 붙인다.
		
		b_title = multi.getParameter("b_title");
		b_content = multi.getParameter("b_content");
		b_user = multi.getParameter("b_user");
		
		// 파일 이름들 가져오기
		Enumeration files = multi.getFileNames();
		String name1 = files.nextElement().toString();
		
		// 파일 원래 이름
		orifile = multi.getOriginalFileName(name1);
		// 파일 이름 중복시 최종 파일 이름
		file = multi.getFilesystemName(name1);
		
		
		
		
		BoardDTO bdto = new BoardDTO();
		bdto.setB_title(b_title);
		bdto.setB_content(b_content);
		bdto.setB_user(b_user);
		bdto.setB_file(file);
		
		int check = bdao.insertBoard(bdto);
		
		if(check == 1) {
			// 저장 성공
%>
			<script>
				alert("성공적으로 저장이 되었습니다.");
				location.href="list.jsp";
			</script>
<%
		}
		else if(check == 0) {
			// 저장 실패
%>
			<script>
				alert("저장에 실패했습니다. 다시 시도해 주세요.");
				history.back();
			</script>
<%		
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드</title>
	
	</head>
	<body>
	
	</body>
</html>