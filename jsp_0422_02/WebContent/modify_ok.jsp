<%@page import="com.jabalec.ex.BoardDAO"%>
<%@page import="com.jabalec.ex.BoardDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	String old_file="";
	
	try {
		
		// request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
		MultipartRequest multi = 
			new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		// DefaultFileRenamePolicy() : 똑같은 이름의 파일이 업로드 되면 뒤에 1, 2, 3, ... 을 붙인다.
		
		b_num = Integer.parseInt(multi.getParameter("b_num"));
		b_title = multi.getParameter("b_title");
		b_content = multi.getParameter("b_content");
		b_user = multi.getParameter("b_user");
		
		// 파일 이름들 가져오기
		Enumeration files = multi.getFileNames();
		String name1 = files.nextElement().toString();
		// 파일 이름 중복시 최종 파일 이름
		file = multi.getFilesystemName(name1);
		if(file == null) {
			file = old_file;
		}
		
		
		
		
		BoardDAO bdao = BoardDAO.getInstance();
		BoardDTO bdto = new BoardDTO();
		bdto.setB_num(b_num);
		bdto.setB_title(b_title);
		bdto.setB_content(b_content);
		bdto.setB_user(b_user);
		bdto.setB_file(file);
		
		int check = bdao.updateBoard(bdto);
		
		if(check == 1) {
			// 수정 성공
%>
			<script>
				alert("성공적으로 수정 되었습니다.");
				location.href="list.jsp";
			</script>
<%
		}
		else if(check == 0) {
			// 수정 실패
%>
			<script>
				alert("수정에 실패했습니다. 다시 시도해 주세요.");
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
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>