/**
 * 
 */
function login_check() {
	
	if(login.id.value == "") {
		alert("아이디를 입력해 주세요.");
		login_form.id.focus();
		return false;
	}
	
	if(login.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		login_form.pw.focus();
		return false;
	}
	
	return login.submit();
}

// 아이디 중복체크를 위한 팝업창 열기
function open_id_overlap_check() {
	
	//새창띄우기 (팝업할 파일이름, 팝업창 아이디, 팝업창 옵션)
	window.open(
			"id_overlap_check.jsp",
			"id_overlap_check",
			"width=600, height=400, resizable=no, scrollbars=no"
	
	);
}

// 아이디 유효성 검사
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

// join.jsp 페이지에 중복체크한 아이디 값 넘기기 
function join_id_input() {
	
	opener.document.getElementById("id").value = document.getElementById("ch_id").value;
	
	window.close();

}

// 주소검색
function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			jQuery("#address1").val(data.zonecode);
			jQuery("#address2").val(data.address);
			jQuery("#address3").focus();
		}
	}).open();
}


// 회원가입 유효성 검사
function join_check() {
	
	if(join.id.value == "") {
		alert("아이디를 입력해 주세요.");
		join.id.focus();
		return false;
	}
	
	// pw - 3글자 이상, 대문자, 소문자, 숫자만 가능
	var pw_check = /^[a-zA-z0-9]{3,}$/;
	if(join.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		join.pw.focus();
		return false;
	}
	if(!(pw_check.test(join.pw.value))) {
		alert("아이디는 3자이상, 영문 소문자, 대문자, 숫자만 입력 가능합니다.");
		join.pw.focus();
		return false;
	}
	if(join.pw_check.value == "") {
		alert("패스워드 체크를 입력해 주세요.");
		join.pw_check.focus();
		return false;
	}
	if(join.pw.value != join.pw_check.value) {
		alert("패스워드와 패스워드 체크가 일치하지 않습니다. 다시 입력해 주세요.")
		join.pw.value = "";
		join.pw_check.value = "";
		join.pw.focus();
		return false;
	}
	
	
	// name 유효성검사 - 1자리 이상, 국문만 가능
	var name_check = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,}$/;

	if(join.name.value == "") {
		alert("이름을 입력해 주세요.");
		join.name.focus();
		return false;
	}
	if(!(name_check.test(join.name.value))) {
		alert("이름은 1자이상 국문만 가능합니다.");
		join.name.focus();
		return false;
	}
	
	if(join.email.value == "") {
		alert("이메일을 입력해 주세요.");
		join.email.focus();
		return false;
	}
	
	if(join.address1.value == "" 
		|| join.address2.value == "" 
		|| join.address3.value == "") {
		alert("주소를 입력해 주세요.");
		document.getElementById("address_btn").click();
		return false;
	}
	
	return join.submit();
}

// 회원정보수정 유효성 검사
function modify_check() {
	// pw - 3글자 이상, 대문자, 소문자, 숫자만 가능
	var pw_check = /^[a-zA-z0-9]{3,}$/;
	if(modify.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		modify.pw.focus();
		return false;
	}
	if(!(pw_check.test(modify.pw.value))) {
		alert("아이디는 3자이상, 영문 소문자, 대문자, 숫자만 입력 가능합니다.");
		modify.pw.focus();
		return false;
	}
	
	// name 유효성검사 - 1자리 이상, 국문만 가능
	var name_check = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,}$/;

	if(modify.name.value == "") {
		alert("이름을 입력해 주세요.");
		modify.name.focus();
		return false;
	}
	if(!(name_check.test(modify.name.value))) {
		alert("이름은 1자이상 국문만 가능합니다.");
		modify.name.focus();
		return false;
	}
	
	if(modify.email.value == "") {
		alert("이메일을 입력해 주세요.");
		modify.email.focus();
		return false;
	}
	
	if(modify.address1.value == "" 
		|| modify.address2.value == "" 
		|| modify.address3.value == "") {
		alert("주소를 입력해 주세요.");
		document.getElementById("address_btn").click();
		return false;
	}
	
	
	modify.submit();
}

function delete_check() {
	var check = confirm("계정을 삭제 하시겠습니까?\n삭제하시면 데이터 복구가 어렵습니다.");
	
	if(check == true) {
		location.href="delete.jsp?id=" + modify.id.value;		
	}
	else {
		return false;
	}
} 



