<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/event_list.css">
</head>
<body>
	<c:if test="${check == 1 }">
		<script type="text/javascript">
			alert("정상적으로 처리 되었습니다.");
		</script>
	</c:if>
	<c:if test="${check == 0 }">
		<script type="text/javascript">
			alert("정상적으로 처리되지 않았습니다. 다시 시도해 주세요.");
			history.back(-1);
		</script>
	</c:if>
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
		<h1>EVENT</h1>

		<article id="event_list">
			<ul>
				<c:forEach var="list" items="${ebdtos }">
					<li>
						<a href="event_content_view.doe?eId=${list.eId }" >
							<img src="upload/${list.eTitleimg }" alt="${list.eTitleimg }" class="event-img" />
							
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today"/>
							<fmt:formatDate value="${list.eStartdate }" pattern="yyyy-MM-dd" var="eStartdate"/>
							<fmt:formatDate value="${list.eEnddate }" pattern="yyyy-MM-dd" var="eEnddate"/>
							
							<c:choose>
								<c:when test="${eStartdate <= today && eEnddate >= today}">
									<div class="event-now">진행중</div>
								</c:when>
								<c:otherwise>
									<div class="event-end">종료</div>
								</c:otherwise>
							
							</c:choose>
																			
							<div class="event-title">${list.eTitle }</div>
							<div class="event-date">${list.eStartdate } ~ ${list.eEnddate }</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</article>

		<ul class="page-num">
			<!-- 첫페이지 이동 -->
			<a href="event_list.doe?page=1"><li class="first"></li></a>
			
			<!-- 이전페이지 -->
			<c:if test="${page <= 1 }">
				<li class="prev"></li>
			</c:if>
			<c:if test="${page > 1}">
				<a href="event_list.doe?page=${page-1 }"><li class="prev"></li></a>
			</c:if>
			
			<!-- 순차적으로 페이지 출력 -->
			<c:forEach var="i" begin="${startpage }" end="${endpage }" step="1">
				<c:choose>
					<c:when test="${i == page }">
						<li class="num"><div>${i }</div></li>
					</c:when>
					<c:when test="${i != page }">
						<a href="event_list.doe?page=${i }">
							<li class="num"><div>${i }</div></li>
						</a>		
					</c:when>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 페이지 이동 -->
			<c:if test="${page >= maxpage }">
				<li class="next"></li>
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="event_list.doe?page=${page+1 }"><li class="next"></li></a>
			</c:if>
			
			<!-- 마지막페이지로 이동 -->
			<a href="event_list.doe?page=${maxpage }"><li class="last"></li></a>
		</ul>

		<a href="event_write_view.doe">
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