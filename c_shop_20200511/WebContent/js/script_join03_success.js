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

function go_login_page() {
	location.href="../../html/kwh/login.html";
}
