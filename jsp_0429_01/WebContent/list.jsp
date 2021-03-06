<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	// int listcount = Integer.parseInt(request.getAttribute("listcount").toString()); // 가능
	// int listcount2 = Integer.parseInt((Stirng)request.getAttribute("listcount")); // 에러
	// (listcount 값 자체가 처음에 Integer이었다. Attribute 가 저장되면서 Integer형 Object로 들어 갔기 때문에)
    // (int 로 변환하는 거는 안된다.)
    
    int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/notice_list.css">
</head>
<body>
	<header>
		<ul>
			<li><a href="#">회원가입</a></li>
			<span>|</span>
			<li><a href="#">로그인</a></li>
			<span>|</span>
			<li><a href="#">고객행복센터</a></li>
			<span>|</span>
			<li><a href="#">배송지역검색</a></li>
			<span>|</span>
			<li><a href="#">관리자모드</a></li>
		</ul>
	</header>

	<nav>
		<a href="#"><div class="logo"></div></a> <a href="#">
			<div id="search">
				<div class="search"></div>
				<br> <span>메뉴찾기</span>
			</div>
		</a> <a href="#">
			<div id="cart">
				<div class="cart"></div>
				<br> <span>장바구니</span>
			</div>
		</a>

		<div class="nav-menu">
			<ul>
				<li><a href="#">COOKIT소개</a></li>
				<li><a href="#">COOKIT 메뉴</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">MY쿡킷</a></li>
			</ul>
		</div>
	</nav>

	<section>
		<h1>NOTICE</h1>
		<div class="wrapper">
			<form action="/search" name="search" method="post">
				<select name="category" id="category">
					<option value="0">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>

				<div class="title">
					<input type="text" size="16">
				</div>

				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>

		<table>
			<colgroup>
				<col width="15%">
				<col width="40%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<!--  제목부분 -->
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<!-- 내용부분 -->
			<c:forEach var="list" items="${bdtos }">
				<tr>
					<td><span class="table-notice">${list.getbId() }</span></td>
					<td>
						<c:forEach begin="1" end="${list.getbIndent() }">&nbsp&nbsp</c:forEach>
						<c:if test="${list.getbIndent() > 0 }">┖</c:if>
						<a href="content_view.do?bId=${list.getbId() }">${list.getbTitle() }</a>
					</td>
					<td>${list.getbName() }</td>
					<td>${list.getbDate() }</td>
					<td>${list.getbHit() }</td>				
			</c:forEach>

		</table>

		<ul class="page-num">
			<!-- 첫 페이지 이동 -->
			<a href="list.do?page=1"><li class="first"></li></a>
			
			<!-- 이전페이지 이동 -->
			<c:if test="${page <= 1 }">
				<li class="prev"></li>
			</c:if>
			<c:if test="${page>1 }">
				<a href="list.do?page=${page-1 }"><li class="prev"></li></a>
			</c:if>
			
			<!-- 순차적으로 페이지 출력 -->
			<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
				<c:choose>
					<c:when test="${a == page }">
						<li class="num"><div>${a }</div></li>			
					</c:when>
					<c:when test="${a != page }">
						<a href="list.do?page=${a }">
							<li class="num"><div>${a }</div></li>
						</a>
					</c:when>
				</c:choose>
			
			</c:forEach>
			<!-- 다음페이지 이동 -->
			<c:if test="${page>=maxpage }">
				<li class="next"></li>
			</c:if>
			<c:if test="${page<maxpage }">
				<a href="list.do?page=${page+1 }"><li class="next"></li></a>
			</c:if>
			
			<!-- 마지막페이지 이동 -->
			<a href="list.do?page=${maxpage }"><li class="last"></li></a>
		</ul>

		<a href="write_view.do">
			<div class="write">쓰기</div>
		</a>
	</section>

	<footer>
		<div class="wrapper">
			<div class="footer-left">
				<a href="#"><div class="footer-logo"></div></a>
				<div class="copyright">© COOKIT ALL RIGHTS RESERVED</div>
			</div>

			<div class="footer-center">
				<ul class="footer-nav">
					<li class="first-list"><a href="#">이용약관</a></li>
					<li class="green"><a href="#">개인정보처리 방침</a></li>
					<li><a href="#">법적고지</a></li>
					<li><a href="#">사업자정보 확인</a></li>
				</ul>

				<ul class="footer-info">
					<li class="first-list">씨제이제일제당(주)</li>
					<li>대표이사 : 손경식,강신호,신현재</li>
					<li>사업자등록번호 : 104-86-09535</li>
					<li class="first-list">주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</li>
					<li>통신판매업신고 중구 제 07767호</li>
					<li class="first-list">개인정보보호책임자 : 조영민</li>
					<li>이메일 : cjon@cj.net</li>
					<li>호스팅제공자 : CJ올리브네트웍스㈜</li>
				</ul>

				<div id="check">
					고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span
						class="check"><a href="#">가입 사실 확인</a></span>
				</div>
			</div>

			<div class="footer-right">
				<a href="#">
					<div id="shortcut">
						<span>CJ그룹계열사 바로가기</span>
						<div class="shortcut"></div>
					</div>
				</a>

				<div class="call">고객행복센터 1668-1920</div>
				<a href="#">
					<div class="inquery">1:1 문의</div>
				</a>
			</div>

		</div>
	</footer>

</body>
</html>