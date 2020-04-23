<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core</title>
	</head>
	<body>
		<%--
			JSP - JSTL - core 를 이용하여
			89점 학점 B를 if 비교문 만들어 보세요.
		 --%>
		 
		 <c:set var="score" value="89" />
		 
		 <c:if test="${ score >= 90 }">
		 	점수는 : <c:out value="${score }"/> - A 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ score >= 80 && score < 90 }">
		 	점수는 : <c:out value="${score }" /> - B 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ score >= 70 && score < 80 }">
		 	점수는 : <c:out value="${score }" /> - C 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ score >= 60 && score < 70 }" >
		 	점수는 : <c:out value="${score }" /> - D 학점 입니다. <br/>
		 </c:if>
		 <c:if test="${ score < 60 }">
		 	점수는 : <c:out value="${score }" /> - E 학점 입니다. <br/>
		 </c:if>
	</body>
</html>