package com.javalec.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {

	// 전역변수들 선언
	ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
	
	// DB 접속에 필요한 객체 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member2";
	
	String id, pw, name, phone1, phone2, phone3, gender;
	
	// 생성자
	public MemberDAO() {
		// DB에 접속하려면
		
		try {
			// jdbc 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	// 전체 리스트 출력
	public ArrayList<MemberDTO> memder_Select() {
		
		try {
			// Connection 연결
			// PrepareStatement 연결
			// executeQuery(), executeUpdate()
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "ora_user", "1234");
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
					
					MemberDTO mdto = new MemberDTO(id, pw, name, phone1, phone2, phone3, gender);
					
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
