

$(document).ready(function(){
	$("#email_type").change(function(){
		info_input_form.email_tail.value=info_input_form.email_type.value;
	});
	
	$("#all_agree").change(function(){
		if($("#all_agree").is(":checked")){
			agree_form.s_agree.value="yes";
			agree_form.c_agree.value="yes";
		}
		else{
			$("#c_agree_yes").prop('checked', false);
			$("#c_agree_no").prop('checked', false);
			$("#s_agree_yes").prop('checked', false);
			$("#s_agree_no").prop('checked', false);
		}
	})
	
	
	$("#submit").click(function() {
		var name_ch=/^[A-Z]{1,}$/;
		var email_head_ch=/^[0-9a-zA-Z]{1,}$/;
		var email_tail_ch=/^[.]+$/;
		var email_tail_ch2=/^[0-9a-zA-Z]{1,}$/;
		var tel_ch=/^[0-9]{10,}$/;
		
		if(!(name_ch.test(info_input_form.sup_name.value))){
		alert("이름은 영문 대문자만 입력가능합니다.");
		info_input_form.sup_name.value="";
		info_input_form.sup_name.focus();
		return false;
		}
		if(!(name_ch.test(info_input_form.sub_name.value))){
		alert("이름은 영문 대문자만 입력가능합니다.");
		info_input_form.sub_name.value="";
		info_input_form.sub_name.focus();
		return false;
		}
		if(!(email_head_ch.test(info_input_form.email_head.value))){
		alert("이메일을 정확하게 입력해 주세요.");
		info_input_form.email_head.value="";
		info_input_form.email_head.focus();
		return false;
		}
		if(!(email_tail_ch.test(info_input_form.email_tail.value))&&
				(email_tail_ch2.test(info_input_form.email_tail.value))){
		alert("이메일을 정확하게 입력해 주세요.");
		info_input_form.email_tail.value="";
		info_input_form.email_tail.focus();
		return false;
		}
		if(!(tel_ch.test(info_input_form.tel.value))){
		alert("전화번호를 정확하게 입력해 주세요.");
		info_input_form.tel.value="";
		info_input_form.tel.focus();
		return false;
		}
		if(!(agree_form.s_agree.value=="yes")){
			alert("약관에 동의를 해주셔야 진행이 가능합니다.");
			return false;
		};
		if(!(agree_form.c_agree.value=="yes")){
			alert("약관에 동의를 해주셔야 진행이 가능합니다.");
			return false;
		};
	});
		
	
	
	
	
	
});

	
	