<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			
							
		</style>
		
	</head>
	<body>
		<h2>파일명 : ${requestScope.select_address }</h2>
		
		<h2> list 출력 </h2>
		<div id="main_list">
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>가입일자</th>
				</tr>
		
				<c:forEach var="dto" items="${dtos }" >
					<tr>
						<td><a href="ex0424_05_update.jsp?id='${dto.getId() }'">${dto.getId() }</a></td>
						<td>${dto.getPw() }</td>
						<td>${dto.getName() }</td>
						<td>${dto.getEmail() }</td>
						<td>${dto.getAddress() }</td>
						<td>${dto.getB_date() }</td>
					</tr>
				
				</c:forEach>
			</table>
		</div>
		
	</body>
</html>