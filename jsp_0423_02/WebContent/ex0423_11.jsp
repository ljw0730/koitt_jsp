<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - fmt - formatDate</title>
	</head>
	<body>
		<jsp:useBean id="t_date" class="java.util.Date" />
		
		<h2> EL 태그 사용 </h2>
		<h4> 현재 날짜 : <fmt:formatDate value="${t_date }" pattern="yyyy/MM/dd" /> </h4>
		
		<p>====================================================================</p>
		
		<h2> 표현식 사용 - 날짜/시간 </h2>
		<%-- type="both" : 날짜/시간 둘다 찍음 --%>
		<h4><fmt:formatDate value="<%= new Date() %>" type="both"/></h4>
		
		<p>--------------------------------------------------------------------</p>
		
		<h2> 표현식 사용 - 날짜만 </h2>
		<%-- type="date" : 날짜만 찍음 --%>
		<h4><fmt:formatDate value="<%= new Date() %>" type="date"/> </h4>
		
		<p>--------------------------------------------------------------------</p>
		
		<h2> 표현식 사용 - 시간만 </h2>
		<%-- type="time" : 시간만 찍음 --%>
		<h4><fmt:formatDate value="<%= new Date() %>" type="time"/> </h4>
	
	</body>
</html>