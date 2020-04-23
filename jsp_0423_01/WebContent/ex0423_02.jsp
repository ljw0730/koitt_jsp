<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="member" class="com.javalec.ex.MemberInfo" scope="page" />
<jsp:setProperty name="member" property="name" value="홍길동" />
<jsp:setProperty name="member" property="id" value="admin" />
<jsp:setProperty name="member" property="pw" value="1234" />    
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - LE 태그 연습</title>
	</head>
	<body>
	
		<h2> Bean 태그 사용 </h2>
		<jsp:getProperty name="member" property="name" /> <br/>
		<jsp:getProperty name="member" property="id" /> <br/>
		<jsp:getProperty name="member" property="pw" /> <br/>
		
		<h2> EL 태그 사용 </h2>
		${member.name } <br/>
		${member.id } <br/>
		${member.pw } <br/>
	
	</body>
</html>