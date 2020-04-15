<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id;
	String pw;
	String name;
	String phone1;
	String phone2;
	String phone3;
	String gender;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 회원가입 연습 (회원 정보 수정)</title>
		<script type="text/javascript">
			function check() {
							
				var name_ch = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/;
				
				if(modify.name.value == "") {
					alert("이름을 입력해 주세요.");
					modify.name.focus();
					return false;
				}
				
				if(!(name_ch.test(modify.name.value))) {
					alert("이름은 한글만 입력 가능합니다.");
					modify.name.focus();
					return false;
				}
	
				var phone_ch = /^[0-9]{4,4}$/;
				
				if(modify.phone2.value == "") {
					alert("전화번호를 입력해 주세요.");
					modify.phone2.focus();
					return false;
				}
				
				if(!(phone_ch.test(modify.phone2.value))) {
					alert("전화번호는 4 자리 숫자만 입력 가능합니다.");
					join.phone2.focus();
					return false;
				}
				
				if(modify.phone3.value == "") {
					alert("전화번호를 입력해 주세요.");
					modify.phone3.focus();
					return false;
				}
				
				if(!(phone_ch.test(modify.phone3.value))) {
					alert("전화번호는 4 자리 숫자만 입력 가능합니다.");
					modify.phone3.focus();
					return false;
				}
				
				if(modify.gender.value == "") {
					alert("성별을 선택해 주세요.");
					modify.gender.focus();
					return false;
				}
			
				return modify.submit();
			}		
		</script>
	</head>
	<body>
	<% 
		String auth_user = (String)session.getAttribute("auth_user");
		String sql = "select * from member2 where id='" + auth_user + "'";
	//	String sql = "select * from member2 where id='aaa'";	
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs != null) {
				while(rs.next()) {
					pw = rs.getString("pw");
					name = rs.getString("name");
					phone1 = rs.getString("phone1");
					phone2 = rs.getString("phone2");
					phone3 = rs.getString("phone3");
					gender = rs.getString("gender");
				}
			} else {
				// 정보가 없을때
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	%>
		<form action="Modify_Ok" name="modify" method="get">
			<h2> 회 원 정 보 수 정 </h2>
			
			<label for="id">아이디</label>
			<%= auth_user %><br/>
			<label for="pw1">패스워드</label>
			<input type="password" name="pw1" id="pw1" /> <br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value=<%= name %>><span> * 이름은 한글만 가능</span>  <br/>
			
			<!--  -->
			
			<label for="">전화번호</label>
			<select name="phone1">
			<%
				switch(phone1) {
					case "010" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" selected>010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
			<% 			
						break;
								
					case "011" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" >010</option>
						<option value="011" selected>011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
			
			<%			
						break;
						
					case "016" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" selected>016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
			
			<%			
						break;
						
					case "017" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" selected>017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
			
			<%			
						break;
						
					case "018" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" selected>018</option>
						<option value="019" >019</option>
			
			<%			
						break;
						
					case "019" :
			%>
						<option value="" disabled>선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" selected>019</option>
				
			<%			
						break;
				}
			%>
			</select>
			<!--  -->
			<span> - </span>
			<input type="text" name="phone2" value=<%= phone2 %> />
			<span> - </span>
			<input type="text" name="phone3" value=<%= phone3 %> /> 
			<br/>
			
			<label for="">성별:</label>
			<% 
				if(gender.equals("남자")) {
			%>
				<!-- 남자 일때 -->
					<input type="radio" name="gender" value="남자" id="man" checked>
					<label for="man">남자</label>
					<input type="radio" name="gender" value="여자" id="woman">
					<label for="woman">여자</label>
			
			<% 		
				}
				else {
			%>	
				<!-- 여자 일때 -->
					<input type="radio" name="gender" value="남자" id="man">
					<label for="man">남자</label>
					<input type="radio" name="gender" value="여자" id="woman" checked>
					<label for="woman">여자</label>
				
			<%		
				}
			%>			
			<br/>
			
			<input type="button" value="회원정보수정" onclick="check()"/>
			<input type="reset" value="취소" />
		</form>
	</body>
</html>