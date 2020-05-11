/**
 * 
 */
$(document).ready(function() {
	$(".main_menu_list>a").mouseenter(function() {
		$(this).css({
			"border-bottom": "3px solid red"
		});
	});
	
	$(".main_menu_list>a").mouseleave(function() {
		$(this).css({
			"border-bottom": "0px"
		});
	});
});

function formCheck() {
	if (agree.f_agree.value !== 'agree') {
		alert('이용약관에 동의하셔야 진행 가능합니다.')
		return false
	}
	
	if (agree.s_agree.value !== 'agree') {
		alert('개인정보 수입, 이용에 동의하셔야 진행 가능합니다.')
		return false
	}

	if (agree.t_agree.value !== 'agree') {
		alert('개인정보 취급위탁에 동의하셔야 진행 가능합니다.')
		return false
	}
	
	return agree.submit();
}