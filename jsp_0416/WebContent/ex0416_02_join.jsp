<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String auth_user = (String)session.getAttribute("auth_user");
	if(auth_user == null) {
		out.println("<script>alert('로그인이 되어 있지 않습니다. \n 로그인을 해주세요.');");
		out.println("location.href='ex0416_02_login.jsp';</script>");
	}

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 로그인/회원정보입력/회원정보수정 연습 - 회원정보입력 화면</title>
	</head>
	<body>
		
		<form action="Join_Ok" name="join" method="post">
			<h2>회원정보 입력</h2>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" /><br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" /><br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" /><br/>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" /><br/>
			<label for="address">주소</label>
			<input type="text" name="address" id="address" /><br/>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" /><br/>
			<label for="birth">생일</label>
			<input type="date" name="birth" id="birth" /><br/>
			
			<label for="">성별 : </label>
			<input type="radio" name="gender" id="man" value="남성"/>
			<label for="man">남성</label>
			<input type="radio" name="gender" id="woman" value="여성"/>
			<label for="woman">여성</label>
			<br/>
			
			<label for="">뉴스레터 수신여부 : </label>
			<input type="radio" name="news" id="new_y" value="예"/>
			<label for="new_y">예</label>
			<input type="radio" name="news" id="new_n" value="아니오"/>
			<label for="new_n">아니오</label>
			<br/>
			
			<label for="">SMS 수신여부 : </label>
			<input type="radio" name="sms" id="sms_y" value="예"/>
			<label for="sms_y">예</label>
			<input type="radio" name="sms" id="sms_n" value="아니오"/>
			<label for="sms_n">아니오</label>
			<br/>
			
			<input type="submit" value="전송" />
			<input type="reset" value="취소" />
		
		</form>
	
	
	</body>
</html>