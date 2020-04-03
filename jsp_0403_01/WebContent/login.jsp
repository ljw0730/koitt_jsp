<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 관리자인증 연습</title>
		<script type="text/javascript">
			function check() {
				if(form.name.value == "") {
					alert("이름을 입력해 주세요.");
					form.name.focus();
					return false;
				}
				
				if(form.id.value == "") {
					alert("아이디를 입력해 주세요.");
					form.id.focus();
					return false;
				}
				
				if(form.pw.value == "") {
					alert("패스워드를 입력해 주세요.");
					form.pw.focus();
					return false;
				}
				
				return form.submit();
			}
		
		</script>
	</head>
	<body>
	
		<h2>관리자 로그인</h2>
		<form action="ex0403_13.jsp" name="form" method="post">
			<label for="name">이름</label>
			<input type="text" name="name" id="name"> <br/>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"> <br/>
			<label for="pw">패스워드</label>
			<input type="text" name="pw" id="pw"> <br/>
			
			<input type="button" onclick="check()" value="로그인" />					
		</form>
		
		<% 
			if(!(request.getParameter("id") == null)) {
				out.println(request.getParameter("id") + "가 잘못 입력되었습니다.<br/>");
				out.println("다시 한번 확인해 주세요.<br/>");
			}
		
		%>
	</body>
</html>