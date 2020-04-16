<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String auth_user = (String)session.getAttribute("auth_user");
	if(auth_user == null) {
		out.println("<script>alert('로그인이 되어 있지 않습니다. \n 로그인을 해주세요.');");
		out.println("location.href='ex0416_02_login.jsp';</script>");
	}    
%>

<%!
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	int ch;
	
	String id;
	String pw;
	String name;
	String email;
	String address;
	String phone;
	Timestamp birth;
	String gender;
	String news;
	String sms;
	
	String sql;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - DB이용 로그인/회원정보입력/회원정보수정 연습 - 회원정보수정 화면</title>
	</head>
	<body>
	<%
		try {
			id = request.getParameter("id");
			
			sql = "select * from lms_member where id=?";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do{
					pw = rs.getString("pw");
					name = rs.getString("name");
					email = rs.getString("email");
					address = rs.getString("address");
					phone = rs.getString("phone");
					birth = rs.getTimestamp("birth");
					gender = rs.getString("gender");
					news = rs.getString("news");
					sms = rs.getString("sms");
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch(Exception e2){
				e2.printStackTrace();
			}
		}
	
		%>
	
		<form action="Modify_Ok" name="modify" method="post">
			<h2>회원정보 수정</h2>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value=<%=id%> readonly><br/>
			<label for="pw">패스워드</label>
			<input type="password" name="pw" id="pw" value=<%=pw%>><br/>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value=<%=name%>><br/>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value=<%=email%>><br/>
			<label for="address">주소</label>
			<input type="text" name="address" id="address" value=<%=address%>><br/>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" value=<%=phone%>><br/>
			<label for="birth">생일</label>
			<input type="date" name="birth" id="birth" value=<%=birth%>><br/>
			
			
			<label for="">성별 : </label>
			<%
				switch(gender) {
					case "남성" :
			%>
						<input type="radio" name="gender" id="man" value="남성" checked/>
						<label for="man">남성</label>
						<input type="radio" name="gender" id="woman" value="여성"/>
						<label for="woman">여성</label>	
			<%			
						break;
					case "여성" :
			%>
						<input type="radio" name="gender" id="man" value="남성" />
						<label for="man">남성</label>
						<input type="radio" name="gender" id="woman" value="여성" checked/>
						<label for="woman">여성</label>
			<%			
						break;
				}
			%>
			<br/>
			
			<label for="">뉴스레터 수신여부 : </label>
			<%
				switch(news) {
					case "예" :
			%>
						<input type="radio" name="news" id="new_y" value="예" checked/>
						<label for="new_y">예</label>
						<input type="radio" name="news" id="new_n" value="아니오"/>
						<label for="new_n">아니오</label>	
			<%			
						break;
					case "아니오" :
			%>
						<input type="radio" name="news" id="new_y" value="예" />
						<label for="new_y">예</label>
						<input type="radio" name="news" id="new_n" value="아니오" checked/>
						<label for="new_n">아니오</label>	
			<%			
						break;
				}
			%>
			<br/>
			
			<label for="">SMS 수신여부 : </label>
			<%
				switch(sms) {
					case "예" :
			%>
						<input type="radio" name="sms" id="sms_y" value="예" checked/>
						<label for="sms_y">예</label>
						<input type="radio" name="sms" id="sms_n" value="아니오"/>
						<label for="sms_n">아니오</label>	
			<%			
						break;
					case "아니오" :
			%>
						<input type="radio" name="sms" id="sms_y" value="예" />
						<label for="sms_y">예</label>
						<input type="radio" name="sms" id="sms_n" value="아니오" checked/>
						<label for="sms_n">아니오</label>	
			<%			
						break;
				}
			%>
			<br/>
			
			<input type="submit" value="전송" />
			<input type="reset" value="취소" />
		</form>
	</body>
</html>