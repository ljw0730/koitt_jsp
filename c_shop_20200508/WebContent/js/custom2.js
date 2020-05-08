/**
 * 
 */

//////////////////////////////////////////////////////////////////
// notice

function dalete_check(bId) {
	var result = confirm("글을 삭제하시겠습니까?");
	if(result == true) {
		alert("삭제하겠습니다.");
		window.location.href="notice_delete.do?bId="+bId;
	}
	else {
		alert("삭제를 취소합니다.");
	}
}

function write_check() {
	var bName_check = /^[0-9a-zA-Z가-힣]{1,}$/;
	
	if(write.bName.value == "") {
		alert("작성자를 입력해 주세요.");
		write.bName.focus();
		return false;
	}
	if(!(bName_check.test(write.bName.value))) {
		alert("작성자는 영문/국문/숫자만 입력 가능합니다.");
		write.bName.focus();
		return false;
	}

	if(write.bTitle.value == "") {
		alert("제목을 작성해 주세요.");
		write.bTitle.focus();
		return false;
	}
	
	if(write.bContent.value == "") {
		alert("내용을 작성해 주세요.");
		write.bContent.focus();
		return false;
	}
	
	return write.submit();
}

function modify_check() {
	
	if(modify.bTitle.value == "") {
		alert("제목을 작성해 주세요.");
		modify.bTitle.focus();
		return false;
	}
	
	if(modify.bContent.value == "") {
		alert("내용을 작성해 주세요.");
		modify.bContent.focus();
		return false;
	}
	
	return modify.submit();
}

function reply_check() {
var bName_check = /^[0-9a-zA-Z가-힣]{1,}$/;
	
	if(reply.bName.value == "") {
		alert("작성자를 입력해 주세요.");
		reply.bName.focus();
		return false;
	}
	if(!(bName_check.test(reply.bName.value))) {
		alert("작성자는 영문/국문/숫자만 입력 가능합니다.");
		reply.bName.focus();
		return false;
	}

	if(reply.bTitle.value == "[답글]" || reply.bTitle.value == "") {
		alert("제목을 작성해 주세요.");
		reply.bTitle.focus();
		return false;
	}
	
	return reply.submit();
}

///////////////////////////////////////////////////////////////////////
// Event

function event_write_check() {
	
	if(ewrite.eTitle.value == "") {
		alert("제목을 작성해 주세요.");
		ewrite.eTitle.focus();
		return false;
	}
	
	if(ewrite.eStartdate.value == "") {
		alert("시작일을 선택해 주세요.");
		ewrite.eStartdate.focus();
		return false;
	}
	
	if(ewrite.eEnddate.value == "") {
		alert("종료일을 선택해 주세요.");
		ewrite.eEnddate.focus();
		return false;
	}
		
	return ewrite.submit();
}

function event_delete_check(eId) {
	var result = confirm("이벤트 글을 삭제하시겠습니까?");
	if(result == true) {
		alert("삭제하겠습니다.");
		window.location.href="event_delete.doe?eId="+eId;
	}
	else {
		alert("삭제를 취소합니다.");
	}
}

function event_mofify_check() {
	
	if(emodify.eTitle.value == "") {
		alert("제목을 작성해 주세요.");
		emodify.eTitle.focus();
		return false;
	}
	
	if(emodify.eStartdate.value == "") {
		alert("시작일을 선택해 주세요.");
		emodify.eStartdate.focus();
		return false;
	}
	
	if(emodify.eEnddate.value == "") {
		alert("종료일을 선택해 주세요.");
		emodify.eEnddate.focus();
		return false;
	}
	
	return emodify.submit();
}

























