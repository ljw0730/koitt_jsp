<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String b_num = "";
	String b_title = "";
	String b_content = "";
	String b_writer ="";
	
	// 파일 저장 경로 지정
	String path = request.getRealPath("upload");

	// 파일 사이즈 - 업로드 파일 용량 제한
	int size = 1024 * 1024 *100; // 10Mbyte 용량 제한 
	//1024 - Kbyte, 1024*1024 - Mbyte
	
	// 파일 원래 이름
	String orifile ="";
	// 파일 이름 최종 설정 (같은 이름의 파일이 업로드 된 경우 최종적으로 파일 이름을 변경해 준다.)
	String file = "";
	
	String orifile2 = "";
	String file2 ="";
	
	// String b_num2 = request.getParameter("b_num");
	// String b_title2 = request.getParameter("b_title");
	
	try {
		
		// request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
		MultipartRequest multi = 
			new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		// DefaultFileRenamePolicy() : 똑같은 이름의 파일이 업로드 되면 뒤에 1, 2, 3, ... 을 붙인다.

	 	b_num = multi.getParameter("b_num");
		// b_num = request.getParameter("b_num"); 와 같음
		// request를 매개 변수로 넣었기 때문에 가능
	 	b_title = multi.getParameter("b_title");
	 	b_content = multi.getParameter("b_content");
	 	b_writer = multi.getParameter("b_writer");
		
	 	// 파일 이름들 가져오기
	 	Enumeration files =  multi.getFileNames();
		String name1 = (String)files.nextElement();

		// 파일 원래 이름
		orifile = multi.getOriginalFileName(name1);
		
		// 파일 이름 중복시 최종 파일 이름
		file = multi.getFilesystemName(name1);
		
		String name2 = (String)files.nextElement();
		orifile2 = multi.getOriginalFileName(name2);
		file2 = multi.getFilesystemName(name2);
		
		
		//String name2 = (String)files.nextElement();
	 	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>    
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드</title>
		<style type="text/css">
			table {
				width: 100%;
				border: 1px solid black;
				text-align: center;
				border-collapse: collapse;
			}
			table th, td {
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>파일최종이름</th>
				<th>파일예전이름</th>
				<th>다운로드</th>
				<th>파일최종이름2</th>
				<th>파일예전이름2</th>
				<th>다운로드2</th>
			</tr>
			<tr>
				<td><%= b_num %></td>
				<td><%= b_title %></td>
				<td><%= b_content %></td>
				<td><%= b_writer %></td>
				<td><%= file %></td>
				<td><%= orifile %></td>
				<td><a href="upload/<%= file %>">다운로드</a></td>
				<td><%= file2 %></td>
				<td><%= orifile2 %></td>
				<td><a href="upload/<%= file2 %>">다운로드</a></td>
			
			</tr>
		</table>
	</body>
</html>