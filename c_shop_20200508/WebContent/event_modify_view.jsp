<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 수정</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/write.css">
<script type="text/javascript" src="js/custom2.js"></script>
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
		<h1>관리자 이벤트 글쓰기</h1>
		<hr>

		<form action="event_modify.doe" name="emodify" method="post" enctype="Multipart/form-data">
			<input type="hidden" name="eId" value="${ebdto.geteId() }" />
			
			<table>
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tr>
					<th>제목</th>
					<td><input type="text" name="eTitle" value="${ebdto.geteTitle() }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="eContent" cols="50" rows="10">${ebdto.geteContent() }</textarea></td>
				</tr>
				<tr>
					<th>시작 일</th>
					<td><input type="date" name="eStartdate" id="eStartdate" value="${ebdto.geteStartdate() }" /></td>
				</tr>
				<tr>
					<th>종료 일</th>
					<td><input type="date" name="eEnddate" id="eEnddate" value="${ebdto.geteEnddate() }" /></td>
				</tr>
				<tr>
					<th>event화면 이미지</th>
					<td><input type="file" name="eTitleimg" id="eTitleimg" value="${ebdto.geteTitleimg() }" /> </td>
				</tr>
				<tr>
					<th>event 상세 화면 이미지</th>
					<td><input type="file" name="eContentimg" id="eContentimg" value=${ebdto.geteContentimg() }/></td>
				</tr>
			</table>
			<hr>
			<div class="button-wrapper">
				<button type="button" class="write" onclick="event_mofify_check()">수정완료</button>
				<button type="reset" class="cancel" onclick="javascript:window.location.href='event_list.doe'">취소</button>
			</div>
		</form>

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