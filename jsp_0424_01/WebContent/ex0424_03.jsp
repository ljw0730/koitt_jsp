<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - function</title>
	</head>
	<body>
		<h2>JSTL - function 출력</h2>
		
		<h4> 대문자로 출력하기</h4>
		<c:set var="test1" value="function test" />
		<%-- toUpperCase : 전부 대문자로 변환하여 출력 --%>
		입력된 문자 : ${test1}<br/>
		대문자 출력 : ${fn:toUpperCase(test1) }<br/>
		
		<p>=======================================================</p>
		
		<h4> 빈공백 없애기 </h4>
		<c:set var="test2" value=" name : 홍       길동              "/>

		<%-- trim : 빈공백을 없앤다. 맨앞 맨뒤   --%>
		공백문자 포함 :${test2}<br/>
		공백문자 제거 :${fn:trim(test2) }<br/>
		
		<p>-----------------------------------------</p>
		
		<h4> 문자 포함 찾기 </h4>
		
		<%-- contains : 문자 포함 찾기 --%>
		<c:if test="${fn:contains(test2, '동') == true}">
			이름 : ${test2 }<br/>
			당신의 문자에는 '동'이라는 이름이 포함되어 있습니다.<br/>
		</c:if>
		<c:if test="${fn:contains(test2, '동') != true}">
			이름 : ${test2 }<br/>
			당신의 문자에는 '동'이라는 이름이 포함되어 있지 않습니다.<br/>
		</c:if>
	</body>
</html>