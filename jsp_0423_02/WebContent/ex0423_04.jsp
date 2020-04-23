<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
	prefix="c" : 꼭 c를 할 필요는 없지만 통상적으로 c를 사용함.
	             구글 검색시 다 c로 나옴
	             다른 lib도 마찬가지
--%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - JSTL - core</title>
	</head>
	<body>
	
		<h2>jstl 사용</h2>
		<h4> c:set - 값 입력</h4> 
		
		<c:set var="id" value="admin" />
		<c:set var="pw" value="1234" />
		<c:set var="pw2" value="12345" />
		<c:set var="str" value="^a&" />
		<%-- escapeXml : 특수문자를 표시한다. 기본값 true --%>
				
		아이디 : <c:out value="${id }" /> <br/>
		비밀번호 : <c:out value="${pw }" /> <br/>
		비밀번호2 : <c:out value="${pw2 }" /> <br/>
		문자 : <c:out value="${str }" /> <br/>
		
		<p> ------------------------------------------- </p>
		
		<h4> c:remove - 값 삭제</h4>
		
		<c:remove var="pw2"/>
		<%-- c:remove 값을 지운다. --%>
		아이디 : <c:out value="${id }" /> <br/>
		비밀번호 : <c:out value="${pw }" /> <br/>
		비밀번호2 : <c:out value="${pw2 }" /> <br/>
		문자 : <c:out value="${str }" /> <br/>
		
		<p> ------------------------------------------- </p>
		
		<h4> c:catch - 예외처리</h4>
		
		<c:catch var="error">
			<%=2/0 %>
		</c:catch>
		<c:out value="${error }" /><br/>
		
		<p> ------------------------------------------- </p>
		
		<h4> c:catch - if 문</h4>
		
		<%-- esle는 없음 if로 계속 해야함 --%>
		
		<%-- 문자비교 : ' ' 를 넣어야함. --%>
		<c:if test="${id == 'admin' }">
			아이디가 일치합니다 아이디는 <c:out value="${id }" /> <br/>
		</c:if>
		<c:if test="${id != 'admin' }">
			아이디가 일치하기 않습니다. 불일치<c:out value="${id }" /> <br/>
		</c:if>
		
		<%-- 숫자비교 : ' ' 없어도 됨 --%>
		<c:if test="${pw == 1234 }">
			패스워드가 일치합니다 패스워드는 <c:out value="${pw }" /> <br/>
		</c:if>
		<c:if test="${pw != 1234 }">
			패스워드가 일치하기 않습니다. 불일치<c:out value="${pw }" /> <br/>
		</c:if>
		
		<p> =========================================== </p>
		
		<h2> 스크립트릿 사용 </h2>
		<% 
			String id2 = "admin";
			String pw2 = "1234";
			String str2 = "^a&";
		%>
		
		아이디 : <%= id2 %> <br/>
		비밀번호 : <%= pw2 %> <br/>
		문자 : <%= str2 %> <br/>
	
	</body>
</html>