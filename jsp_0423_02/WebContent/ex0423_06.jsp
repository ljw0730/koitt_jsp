<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core</title>
	</head>
	<body>
		 <c:set var="avg" value="${(param.kor + param.eng + param.math)/3 }" />
		 
		 <c:out value="${param.name }" /> 학생의 평균점수는 : <c:out value="${avg }" /> <br/>
		  
		 <c:if test="${ avg >= 90 }">
		 	A 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ avg >= 80 && avg < 90 }">
		 	B 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ avg >= 70 && avg < 80 }">
		 	C 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ avg >= 60 && avg < 70 }" >
		 	D 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ avg < 60 }">
		 	E 학점 입니다. <br/>
		 </c:if>
	</body>
</html>