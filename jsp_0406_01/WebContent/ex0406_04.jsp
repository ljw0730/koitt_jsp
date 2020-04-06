<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - 액션태그 - jsp:include</title>
		<style type="text/css">
			#p01{
				clear:both;
			}
		</style>
	</head>
	<body>
		<p>탑 메뉴가 있는 부분</p>
		<p>네비게이션을 포함</p>
		<jsp:include page="ex0406_04_menu.jsp" />
		<p id="p01">메인이미지 롤링 되어짐</p>
		
	
	</body>
</html>