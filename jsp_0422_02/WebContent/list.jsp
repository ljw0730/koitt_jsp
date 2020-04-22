<%@page import="com.jabalec.ex.BoardDTO"%>
<%@page import="com.jabalec.ex.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	BoardDAO bdao = BoardDAO.getInstance();
	list = bdao.getBoards();
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 파일 업로드</title>
		<style type="text/css">
			#main_list table {
				width: 100%;
				font-size: 12px;
				text-align: center;
				border: 1px solid #d6dce7;
				border-collapse: collapse;
				border-spacing: 0;
			}
			#main_list table tr th {
				height: 35px;
				font-size : 0.92em;
				font-weight: normal;
				color: #fff;
				background: #6f809a;
				padding: 8px 5px;
				border: 1px solid #60718b;
			}
			#main_list table tr td {
				height: 35px;
			}
			#main_list table tr:nth-of-type(2n) {
				background: #eff3f9;
			}
			
			#d_img {
				witdh: 20px; height: 20px;
			}		
		</style>
	</head>
	<body>
		<h2>게시판</h2>
		<div id="main_list">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>파일이름</th>
					<th>다운로드</th>
				</tr>
			<%
				for(int i = 0; i < list.size(); i++) {
					BoardDTO bdto = (BoardDTO)list.get(i);
			%>
					<tr>
						<td><%= bdto.getB_num() %></td>
						<td><a href="modify.jsp?b_num=<%= bdto.getB_num() %>"><%= bdto.getB_title() %></a></td>
						<td><%= bdto.getB_content() %></td>
						<td><%= bdto.getB_user() %></td>
						<td><%= bdto.getB_file() %></td>
						<td>
							<a href="upload/<%= bdto.getB_file() %>">
								<img alt="다운로드 이미지" src="img/download.png" id="d_img"/>
							</a>
						</td>
					</tr>
			<%
				}
			%>
			</table>
			<button onclick="javascript:window.location.href='upload_form.jsp'">글쓰기</button>
		</div>
	</body>
</html>