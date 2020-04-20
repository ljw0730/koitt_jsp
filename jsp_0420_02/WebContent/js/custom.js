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