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
		<title>JSTL - fmt - formatNumber</title>
	</head>
	<body>
	
		<%-- groupingUsed="true" : 천단위로 ','를 찍는다. --%>
		<fmt:formatNumber value="123456789" groupingUsed="true" /> <br/>
	
		<c:set var="money1" value="100000000"/>
		<fmt:formatNumber value="${money1 }" groupingUsed="true" /> <br/>
		
		<%-- #: 갯수만큼 찍는다. 없으면 생략한다.--%>
		<fmt:formatNumber value="3.141592" pattern="##.###"/> <br/>
		<fmt:formatNumber value="341" pattern="####"/> <br/>
		
		<%-- 0: 갯수만큼 찍는다. 없으면 0으로 찍는다..--%>
		<fmt:formatNumber value="3.141592" pattern="00.000"/> <br/>
		<fmt:formatNumber value="1" pattern="0000"/> <br/>
	
	</body>
</html>