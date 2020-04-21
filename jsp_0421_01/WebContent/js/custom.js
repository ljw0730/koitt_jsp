/**
 * 
 */

function login_check() {
	
	// id - 대문자, 소문자만 가능
	var id_check = /^[a-zA-z]*$/;
	if(login_form.id.value == "") {
		alert("아이디를 입력해 주세요.");
		login_form.id.focus();
		return false;
	}	
	if(!(id_check.test(login_form.id.value))) {
		alert("아이디는 영문 소문자, 대문자만 입력 가능합니다.");
		login_form.id.focus();
		return false;
	}
	
	// pw - 대문자, 소문자, 숫자, 특수문자만 가능(꼭 1개이상씩 들어가야하는거 아님)
	var pw_check = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/;
		
	if(login_form.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		login_form.pw.focus();
		return false;
	}
	
	if(!(pw_check.test(login_form.pw.value))) {
		alert("패스워드는 영문 소문자, 대문자, 특수문자만 입력 가능합니다.");
		login_form.pw.focus();
		return false;
	}
	
	return login_form.submit();
	
}

function join_check() {
	
	// id 유효성검사 - 3자리 이상, 영문,숫자만 가능
	var id_check = /^[a-zA-z0-9]{3,}$/;
	
	if(join_form.id.value == "") {
		alert("아이디를 입력해 주세요.");
		join_form.id.focus();
		return false;
	}
	if(!(id_check.test(join_form.id.value))) {
		alert("아이디는 영문, 숫자 3자리 이상만 가능합니다.");
		join_form.id.focus();
		return false;
	} 
	
	// pw 유효성검사 - 3자리 이상, 영문1개이상, 숫자1개이상 ,특수문자1개이상 반드시 넣을것
	var pw_check = (/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]).{3,}$/);
	
	if(join_form.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		join_form.pw.focus();
		return false;
	}
	if(!(pw_check.test(join_form.pw.value))) {
		alert("패스워드는 영문, 숫자, 특수문자가 1개씩 들어가야 하며\n" +
				"3자리 이상이여 합니다.");
		join_form.pw.focus();
		return false;
	}
	
	if(join_form.pw_check.value == "") {
		alert("패스워드 체크를 입력해 주세요.");
		join_form.pw_check.focus();
		return false;
	}
	
	if(join_form.pw.value != join_form.pw_check.value) {
		alert("패스워드와 패스워드 체크가 일치하지 않습니다. 다시 입력해 주세요.")
		join_form.pw.value = "";
		join_form.pw_check.value = "";
		join_form.pw.focus();
		return false;
	}

	// name 유효성검사 - 1자리 이상, 국문만 가능
	var name_check = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,}$/;

	if(join_form.name.value == "") {
		alert("이름을 입력해 주세요.");
		join_form.name.focus();
		return false;
	}
	if(!(name_check.test(join_form.name.value))) {
		alert("이름은 1자이상 국문만 가능합니다.");
		join_form.name.focus();
		return false;
	}
	
	if(join_form.email.value == "") {
		alert("이메일을 입력해 주세요.");
		join_form.email.focus();
		return false;
	}
	
	if(join_form.address.value == "") {
		alert("주소를 입력해 주세요.");
		join_form.address.focus();
		return false;
	}
	
	return join_form.submit();
	
}

function modify_check() {
	
	// pw 유효성검사 - 3자리 이상, 영문1개이상, 숫자1개이상 ,특수문자1개이상 반드시 넣을것
	var pw_check = (/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]).{3,}$/);
	
	if(modify_form.pw.value == "") {
		alert("패스워드를 입력해 주세요.");
		modify_form.pw.focus();
		return false;
	}
	if(!(pw_check.test(modify_form.pw.value))) {
		alert("패스워드는 영문, 숫자, 특수문자가 1개씩 들어가야 하며\n" +
				"3자리 이상이여 합니다.");
		modify_form.pw.focus();
		return false;
	}
	
	// name 유효성검사 - 1자리 이상, 국문만 가능
	var name_check = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,}$/;

	if(modify_form.name.value == "") {
		alert("이름을 입력해 주세요.");
		modify_form.name.focus();
		return false;
	}
	if(!(name_check.test(modify_form.name.value))) {
		alert("이름은 1자이상 국문만 가능합니다.");
		modify_form.name.focus();
		return false;
	}
	
	if(modify_form.email.value == "") {
		alert("이메일을 입력해 주세요.");
		modify_form.email.focus();
		return false;
	}
	
	if(modify_form.address.value == "") {
		alert("주소를 입력해 주세요.");
		modify_form.address.focus();
		return false;
	}
	
	return modify_form.submit();
	
}

function delete_check() {
	
	
	var check = confirm("계정을 삭제 하시겠습니까?\n삭제하시면 데이터 복구가 어렵습니다.");
	
	if(check == true) {
		location.href="delete.jsp?id=" + modify_form.id.value;
	}
	else {
		return false;
	}
	
}