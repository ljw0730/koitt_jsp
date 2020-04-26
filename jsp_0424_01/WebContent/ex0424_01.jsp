<%@page import="com.javalec.ex.Bcon.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core</title>
	</head>
	<body>
		<h2>저장된 지역 출력</h2>
		
		
		<hr/>
		
		<%-- itmes 를 사용하는 경우 begin, end, step 은 생략해도 된다. --%>
		<c:forEach var="item" items="서울,부산,경기,인천,대전">
			지역: ${item } <br/>
		
		</c:forEach>
		
		<hr/>
		
		<c:set var="sum" value="0"/>
		<c:forEach var="i" begin="0" end="20" step="1">
			${sum = sum + i } <br/>
		</c:forEach>	
	
	
	</body>
</html>