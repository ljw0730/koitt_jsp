<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core</title>
		<style type="text/css">
			table {
				border: 1px solid black;
				border-collapse: collapse;
			}
			
			table tr, th, td {
				border: 1px solid black;
			}
			
			table th, td {
				width: 100px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<!-- 구구단을 표형식으로 출력하시오. 2~5단 까지만 출력 -->
		<table>
			<tr>
			<c:forEach var="i" begin="2" end="5" step="1">
				<th>${i } 단</th>
			</c:forEach>
			</tr>
			
			<c:forEach var="i" begin="1" end="9" step="1">
			<tr>
				<c:forEach var="j" begin="2" end="5" step="1">
					<td>${j } * ${i } = ${j*i }</td>
				</c:forEach>
			</tr>
			</c:forEach>
		</table>
		
		<p>===========================================================================</p>
		
		<!-- 구구단을 표형식으로 풀력하시오. 2~5단 까지만 출력.
		     단 에서 1, 3, 5, 7, 9 의 곱만 나오게 출력-->
		<table>
			<tr>
			<c:forEach var="i" begin="2" end="9" step="1">
				<th>${i } 단</th>
			</c:forEach>
			</tr>
			<c:forEach var="i" begin="1" end="9" step="1">
				<tr>
					<c:forEach var="j" begin="2" end="9" step="1">
						<c:if test="${i%2 ==1 }">
							<td>${j } * ${i } = ${j*i }</td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		
		</table>
	</body>
</html>