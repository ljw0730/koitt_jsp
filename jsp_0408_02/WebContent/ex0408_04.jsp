<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- post 방식으로 받고 있기 때문에 post 한글 처리를 해주어야 한다. -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="stu_info01" class="com.javalec.ex.Student_info" scope="page"/>
<!-- property="s_number" => class내의 s_number 변수 명 -->
<!-- value="s_number" => form에서 넘어오는 s_number -->
<!-- 원래는 value값을 넣어 주어야 하지만 property와 이름이 같으면 error -->
<!-- form의 name과 property와 이름이 같다면 value를 넣지 않아도 알아서 찾아 값을 넣어준다. -->
<!-- 
<jsp:setProperty name="stu_info01" property="s_number" />
<jsp:setProperty name="stu_info01" property="s_name" />
<jsp:setProperty name="stu_info01" property="s_age" />
<jsp:setProperty name="stu_info01" property="s_grade" />
 -->
 
<jsp:setProperty name="stu_info01" property="*" />


<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - bean - form에서 값 받기</title>
	</head>
	<body>
		<h2>Bean 태그로 데이터 받음</h2>
		학번 : <jsp:getProperty name="stu_info01" property="s_number" /><br/>
		이름 : <jsp:getProperty name="stu_info01" property="s_name" /><br/>
		나이 : <jsp:getProperty name="stu_info01" property="s_age" /><br/>
		학번 : <jsp:getProperty name="stu_info01" property="s_grade" /><br/>
		
		-----------------------------------------------------------------<br/>
		<h2> jsp:getProperty 약식 표현</h2>
		학번 : <%= stu_info01.getS_number() %><br/>
		이름 : <%= stu_info01.getS_name() %><br/>
		나이 : <%= stu_info01.getS_age() %><br/>
		학번 : <%= stu_info01.getS_grade() %><br/>
	
		-----------------------------------------------------------------<br/>
	
		<h2>request 값으로 데이터 받음</h2>
		<%
			int s_number = Integer.parseInt(request.getParameter("s_number"));
			String s_name = request.getParameter("s_name");
			int s_age = Integer.parseInt(request.getParameter("s_age"));
			int s_grade = Integer.parseInt(request.getParameter("s_grade"));
		%>
		
		학번 : <%= s_number %><br/>
		이름 : <%= s_name %><br/>
		나이 : <%= s_age %><br/>
		학년 : <%= s_grade %><br/>
		
			

	
		
		
		
	</body>
</html>