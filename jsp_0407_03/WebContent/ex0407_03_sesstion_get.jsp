<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - session 읽어오기</title>
	</head>
	<body>

		<%
			// session 의 리턴 타입은 Object이다.
			Object obj1 = session.getAttribute("auth_User");
			String auth_User = (String)obj1;
			out.println("session 값 : " + auth_User + "<br/>");
		
			Object obj2 = session.getAttribute("naver_id");
			String naver_id = (String)obj2;
			out.println("session 값 : " + naver_id + "<br/>");
			
			Object obj3 = session.getAttribute("pw");
			int pw = (int)obj3;
			out.println("session 값 : " + pw + "<br/>");
			
			Object obj4 = session.getAttribute("nick_name");
			String nick_name = (String)obj4;
			out.println("session 값 : " + nick_name + "<br/>");
			
			out.println("-------------------------------------------------------<br/>");

			String session_n;
			String session_v;
			//세션에 저장되어 있는 모든 데이터의 이름과 데이터를 갖고오기
			Enumeration enum1 = session.getAttributeNames();
			while(enum1.hasMoreElements()) {
				// enum1의 요소를 사용하고 다음으로 넘겨라
				session_n = enum1.nextElement().toString();
				session_v = session.getAttribute(session_n).toString();
				
				out.println("세션 : name - " + session_n + " / ");
				out.println("value - " + session_v + "<br/>");
			}
			
			out.println("-------------------------------------------------------<br/>");
			
			// 자동생성된 세션의 ID 읽어오기
			String sessionId = session.getId();
			out.println("섹션 고유번호 : " + sessionId + "<br/>");
		
			out.println("-------------------------------------------------------<br/>");
			
			// 세션의 유효시간 읽어오기. 최근 요청시점을 기준으로 카운트
			int inter = session.getMaxInactiveInterval();
			out.println("섹션 유효시간 : " + inter + "<br/>");
			
			out.println("-------------------------------------------------------<br/>");
			
			// 세션 삭제하기
			session.removeAttribute("auth_User");
			
		%>
		
		<a href="ex0407_03_session_del.jsp">세션 지우기</a>
		
	</body>
</html>