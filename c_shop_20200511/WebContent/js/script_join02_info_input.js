/**
 * 
 */
$(document).ready(function() {
//	$(".main_menu_list>a").mouseenter(function() {
//		$(this).css({
//			"border-bottom": "3px solid red"
//		});
//	});
//	
//	$(".main_menu_list>a").mouseleave(function() {
//		$(this).css({
//			"border-bottom": "0px"
//		});
//	});
//	
//	$("#double_check").mouseenter(function() {
//		$(this).css({
//			"cursor": "pointer"
//		});
//	});
//	
//	$("#postal_btn").mouseenter(function() {
//		$(this).css({
//			"cursor": "pointer"
//		});
//	});
	
	$("#mail_tail_dropbox").change(function() {
		var index = document.getElementById("mail_tail_dropbox").selectedIndex;
		switch(index) {
			case 1:
				$("#mail_tail").val("gmail.com");
				break;
			case 2:
				$("#mail_tail").val("naver.com");
				break;
			case 3:
				$("#mail_tail").val("nate.com");
				break;
			case 4:
				$("#mail_tail").val("hotmail.com");
				break;
			case 5:
				$("#mail_tail").val("paran.com");
				break;
			case 6:
				$("#mail_tail").val("empal.com");
				break;
			case 7:
				$("#mail_tail").val("yahoo.com");
				break;
			case 8:
				$("#mail_tail").val("dreamwiz.com");
				break;
			case 9:
				$("#mail_tail").val("hanmail.net");
				break;
				
		}
		
		
	})
	
	
});

//아이디 중복체크를 위한 팝업창 열기
function open_id_overlap_check() {
	// 새창띄우기(팝업할 파일이름, 팝업창 아이디, 팝업창 옵션)
	window.open(
			"join02_id_overlap_check.jsp",
			"id_overlap_check",
			"width=600, height=400, resizeable=no, scrollbars=no"
	);
}

//아이디 유효성 검사
function id_overlap_check() {
	
	// id - 3글자 이상, 대문자, 소문자, 숫자만 가능
	var id_check = /^[a-zA-z0-9]{3,}$/;
	if(id_obverlab_check_form.ch_id.value == "") {
		alert("아이디를 입력해 주세요.");
		id_obverlab_check_form.ch_id.focus();
		return false;
	}	
	if(!(id_check.test(id_obverlab_check_form.ch_id.value))) {
		alert("아이디는 3자이상, 영문 소문자, 대문자, 숫자만 입력 가능합니다.");
		id_obverlab_check_form.ch_id.focus();
		return false;
	}
	
	//document.getElementById("ch_text").innerHTML="사용가능한 아이디 입니다.";

	id_obverlab_check_form.submit();
}


function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			jQuery("#f_postal").val(data.zonecode);
			jQuery("#address1").val(data.address);
			jQuery("#address2").focus();
		}
	}).open();
}

//join.jsp 페이지에 중복체크한 아이디 값 넘기기 
function join_id_input() {
	
	opener.document.getElementById("id").value = document.getElementById("ch_id").value;
	
	window.close();

}

function info_input_formcheck() {
	
	const nameRegex = /^[가-힣]+$/
	if(join.name.value == "") {
		alert('이름을 입력해 주세요.')
		join.name.focus()
		return false
	}
	if (!nameRegex.test(join.name.value)) {
		alert('이름은 한글만 입력해야 합니다.')
		join.name.focus()
		return false
	}
	
	// 아이디 체크
//	const idRegex1 = /^[A-Za-z]/
//	const idRegex2 = /^[A-Za-z0-9!@#\$%\^&\*\(\)\-=`~\[\]\\\{\}\|;':",\.\/<>\?_]{4,16}$/
//
	if(join.id.value == "") {
		alert('중복확인을 통해 아이디를 입력해 주세요.')
		join.id.focus()
		return false
	}
//	if (!idRegex1.test(join.id.value)) {
//		alert('아이디의 첫글자는 영문으로 입력해야 합니다.')
//		join.id.focus()
//		return false
//	}
//
//	if (!idRegex2.test(join.id.value)) {
//		alert('아이디에는 4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다.')
//		join.id.focus()
//		return false
//	}

	// 비밀번호 체크
//	const pwRegex1 = /[A-Za-z]/
//	const pwRegex2 = /\d/
//	const pwRegex3 = /[!@#\$%\^&\*\(\)\-=`~\[\]\\\{\}\|;':",\.\/<>\?_]/
//	let pwTypeNum = 0;

	if(join.pw1.value == "") {
		alert('비밀번호를 입력해 주세요.')
		join.pw1.focus()
		return false
	}

	///////////////////////////////////////////////////
	var pw1_check = /^[a-zA-z0-9]{3,}$/;
	
	if(!(pw1_check.test(join.pw1.value))) {
		alert('영문, 숫자 3자리 이상 입력해 주세요.')
		join.pw1.focus()
		return false
	}
	
	///////////////////////////////////////////////////
	
//	if (pwRegex1.test(join.pw1.value)) pwTypeNum++
//	if (pwRegex2.test(join.pw1.value)) pwTypeNum++
//	if (pwRegex3.test(join.pw1.value)) pwTypeNum++
//
//	if (pwTypeNum < 2) {
//		alert('영문, 숫자, 특수문자 중 적어도 2종류 이상을 조합하여 비밀번호를 만들어주세요.')
//		join.pw1.focus()
//		return false
//	}
//
//	if (pwTypeNum === 2 && join.pw1.value.length < 10) {
//		alert('영문, 숫자, 특수문자 중 2종류 조합 시 비밀번호는 10자리 이상 입력해야 합니다.')
//		join.pw1.focus()
//		return false
//	}
//
//	if (pwTypeNum === 3 && join.pw1.value.length < 8) {
//		alert('영문, 숫자, 특수문자 모두 조합 시 비밀번호는 8자리 이상 입력해야 합니다.')
//		join.pw1.focus()
//		return false
//	}

	// 비밀번호 확인입력 체크
	if(join.pw2.value == "") {
		alert('비밀번호 확인을 입력해 주세요.')
		join.pw2.focus()
		return false
	}
	
	if (join.pw1.value !== join.pw2.value) {
		alert('입력한 비밀번호가 확인란과 일치하지 않습니다.')
		join.pw2.focus()
		return false
	}

	// 이메일 체그
	if(join.mail_id.value == "") {
		alert('이메일을 입력해 주세요.')
		join.mail_id.focus()
		return false
	}
	if(join.mail_tail.value == "") {
		alert('이메일을 입력해 주세요.')
		join.main_tail.focus()
		return false
	}
	
	// 주소 체크
	const adressRegex = /\d/
	
	if(join.f_postal.value == "") {
		alert('우편번호 앞자리를 입력해 주세요.')
		join.f_postal.focus()
		return false
	}
	if (!adressRegex.test(join.f_postal.value)) {
		alert('우편번호는 숫자만 입력해야 합니다.')
		join.f_postal.focus()
		return false
	}
	
//	if(join.l_postal.value == "") {
//		alert('우편번호 뒷자리를 입력해 주세요.')
//		join.l_postal.focus()
//		return false
//	}
//	if (!adressRegex.test(join.l_postal.value)) {
//		alert('우편번호는 숫자만 입력해야 합니다.')
//		join.l_postal.focus()
//		return false
//	}
	
	if(join.address1.value == "") {
		alert('주소를 입력해 주세요.')
		join.address1.focus()
		return false
	}
	if(join.address2.value == "") {
		alert('상세주소를 입력해 주세요.')
		join.address2.focus()
		return false
	}
	
	// 전화번호 체크
	const telRegex = /^\d+$/
	if(join.f_tell.value == "") {
		alert('전화번호를 입력해 주세요.')
		join.f_tell.focus()
		return false
	}
	if(join.m_tell.value == "") {
		alert('전화번호를 입력해 주세요.')
		join.m_tell.focus()
		return false
	}
	if(join.l_tell.value == "") {
		alert('전화번호를 입력해 주세요.')
		join.l_tell.focus()
		return false
	}
		
	if (!telRegex.test(join.f_tell.value) || !telRegex.test(join.m_tell.value) || !telRegex.test(join.l_tell.value)) {
		alert('전화번호는 숫자만 입력해야 합니다.')
		return false
	}
	
	
	// 생년월일 체크
	if(join.birth_year.value == "0") {
		alert('출생년도를 선택해 주세요.')
		join.birth_year.focus()
		return false
	}
	if(join.birth_month.value == "0") {
		alert('출생월를 선택해 주세요.')
		join.birth_month.focus()
		return false
	}
	if(join.birth_day.value == "0") {
		alert('출생월를 선택해 주세요.')
		join.birth_day.focus()
		return false
	}
	
	// 회원번호 체크
	const mNumRegex = /[\-\s]/

	if (mNumRegex.test(join.m_number.value)) {
		alert('회원번호는 하이픈(-)이나 띄어쓰기 없이 입력해야 합니다.')
		join.m_number.focus()
		return false
	}

	// 회원인증번호 체크
	const vNumRegex = /^\d{4}$/

	if (join.v_number.value !== '' && !vNumRegex.test(join.v_number.value)) {
		alert('회원인증번호는 숫자 4자리로 입력해야 합니다.')
		return false
	}

	return $("#join").submit();
}
