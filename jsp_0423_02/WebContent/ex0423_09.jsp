<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<c:set var="check" value="1" />
		
		<%-- <c:choose> : switch 문에 해당 --%>
		<c:choose>
			<%--  <c:when> : switch 문의 case 에 해당 --%>
			<c:when test="${check == 1}">
				<p> 10개의 풀옵션 차량을 선택하셨습니다. </p>
			</c:when>
			<c:when test="${check == 2}">
				<p> 5개의 옵션 차량을 선택하셨습니다. </p>
			</c:when>
			<c:when test="${check == 3}">
				<p> 3개의 옵션 차량을 선택하셨습니다. </p>
			</c:when>
			<%-- <c:otherwise> : switch 문의 default 에 해당  --%>
			<c:otherwise>
				<p> 선택한 옵션이 없습니다.</p>
			</c:otherwise>
		</c:choose>
	
	</body>
</html>