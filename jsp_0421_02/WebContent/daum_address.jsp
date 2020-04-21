<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>다음 지도 검색</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		
			function openDaumZipAddress() {
				 new daum.Postcode({
				        oncomplete: function(data) {
				            jQuery("#postcode1").val(data.postconde1);
				            jQuery("#postcode2").val(data.postconde2);
				            jQuery("#zonecode").val(data.zonecode);
				            jQuery("#address").val(data.address);
				            jQuery("#address_etc").focus();
				        }
				    }).open();
			}
		   
		</script>
	</head>
	<body>
		<form action="join_ok.jsp" name="join" method="post">
			<input type="text" name="postcode1" id="postcode1" value="" readonly />
			&nbsp;&nbsp;
			<input type="text" name="postcode2" id="postcode2" value="" readonly />
			&nbsp;&nbsp;
			<input type="text" name="zonecode" id="zonecode" value="" readonly />
			&nbsp;&nbsp;
			<input type="button" onclick="openDaumZipAddress()" value="우편번호찾기" />
			<br/>
			
			<input type="text" name="addresss" id="address" value="" readonly />
			&nbsp;&nbsp;
			<input type="text" name="address_etc" id="address_etc" value="" />
		
		</form>
	</body>
</html>