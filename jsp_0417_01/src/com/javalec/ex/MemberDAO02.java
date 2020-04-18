package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO02 {

	// 전역변수들 선언
	ArrayList<MemberDTO02> dtos = new ArrayList<MemberDTO02>();
	
	// DB 접속에 필요한 객체 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 커넥션 풀을 위한 변수
	DataSource dataSource;
	
	String id, pw, name, phone1, phone2, phone3, gender;
	
	String sql;
	
	// 생성자
	public MemberDAO02() {
		
		try {
			// 객체 선언 시 바로 jdbc connection 연결
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	// 전체 리스트 출력
	public ArrayList<MemberDTO02> memder_Select() {
		
		try {
			con = dataSource.getConnection();
			
			sql = "select * from member2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				// 데이터 담기
				do {
					id = rs.getString("id");
					pw = rs.getString("pw");
					name = rs.getString("name");
					phone1 = rs.getString("phone1");
					phone2 = rs.getString("phone2");
					phone3 = rs.getString("phone3");
					gender = rs.getString("gender");
					
					MemberDTO02 mdto = new MemberDTO02(id, pw, name, phone1, phone2, phone3, gender);
					
					dtos.add(mdto);
					
				} while(rs.next());
				
				// 리턴값으로 돌려줌
				return dtos;
			}
			else {
				System.out.println("member2 테이블에 값이 존재하지 않습니다.");
				return null;
			}
		} catch (Exception e) {
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
}
