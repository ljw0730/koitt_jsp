<%@page import="com.javalec.ex.Student_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- java 객체 선언 : Student_info stu_info = new Student_info() -->
<!-- id: 객체 명, class: class 위치, scope: 사용범위 -->
<jsp:useBean id="stu_info" class="com.javalec.ex.Student_info" scope="page" />
<jsp:useBean id="stu_info3" class="com.javalec.ex.Student_info" scope="page" />
<jsp:useBean id="stu_info4" class="com.javalec.ex.Student_info" scope="page" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Student_info.java 와 연결되어 있음 -->
	</head>
	<body>
		<!-- 학생 정보 입력 -->
		<jsp:setProperty name="stu_info" property="s_number"  value="1" />
		<jsp:setProperty name="stu_info" property="s_name" value="홍길동" />
		<jsp:setProperty name="stu_info" property="s_age" value="20" />
		<jsp:setProperty name="stu_info" property="s_grade" value="1" />
		
		<jsp:setProperty name="stu_info3" property="s_number"  value="3" />
		<jsp:setProperty name="stu_info3" property="s_name" value="강감찬" />
		<jsp:setProperty name="stu_info3" property="s_age" value="21" />
		<jsp:setProperty name="stu_info3" property="s_grade" value="2" />
		
		<jsp:setProperty name="stu_info4" property="s_number"  value="4" />
		<jsp:setProperty name="stu_info4" property="s_name" value="박보검" />
		<jsp:setProperty name="stu_info4" property="s_age" value="25" />
		<jsp:setProperty name="stu_info4" property="s_grade" value="4" />

		<h2>학생 입력 정보</h2>
		<!-- 학생 정보 출력 -->
		 
		학번 : <jsp:getProperty name="stu_info" property="s_number" />
		이름 : <jsp:getProperty name="stu_info" property="s_name" />
		나이 : <jsp:getProperty name="stu_info" property="s_age" />
		학년 : <jsp:getProperty name="stu_info" property="s_grade" />
		
		<p>------------------------------------------------------------------</p>

		 <% 
		 	Student_info stu_info2 = new Student_info();
		 	stu_info2.setS_number(2);
		 	stu_info2.setS_name("김유신");
		 	stu_info2.setS_age(21);
		 	stu_info2.setS_grade(2);
		 	
		 	out.println("학번 : " + stu_info2.getS_number() + "<br/>");
		 	out.println("이름 : " + stu_info2.getS_name() + "<br/>");
		 	out.println("나이 : " + stu_info2.getS_age() + "<br/>");
		 	out.println("학년 : " + stu_info2.getS_grade() + "<br/>");
		 
		 %>
		
		<p>------------------------------------------------------------------</p>
		
		학번 : <jsp:getProperty name="stu_info3" property="s_number" />
		이름 : <jsp:getProperty name="stu_info3" property="s_name" />
		나이 : <jsp:getProperty name="stu_info3" property="s_age" />
		학년 : <jsp:getProperty name="stu_info3" property="s_grade" />
		
		<p>------------------------------------------------------------------</p>
		
		학번 : <jsp:getProperty name="stu_info4" property="s_number" />
		이름 : <jsp:getProperty name="stu_info4" property="s_name" />
		나이 : <jsp:getProperty name="stu_info4" property="s_age" />
		학년 : <jsp:getProperty name="stu_info4" property="s_grade" />
		
		<p>------------------------------------------------------------------</p>
		
		
		 
	</body>
</html>