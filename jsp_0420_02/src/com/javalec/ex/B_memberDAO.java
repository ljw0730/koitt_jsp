package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class B_memberDAO {

	static B_memberDAO instance = new B_memberDAO();
	
	private B_memberDAO() {
		
	}
	
	public static B_memberDAO getInstance() {
		return instance;
	}
	
	// b_member 테이블 전체 값 가져오기
	public ArrayList<B_memberDTO> getMembers() {
		ArrayList<B_memberDTO> list = new ArrayList<B_memberDTO>();
		
		B_memberDTO mdto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from b_member";
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mdto = new B_memberDTO();
					
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					mdto.setEmail(rs.getString("email"));
					mdto.setAddress(rs.getString("address"));
					mdto.setB_date(rs.getTimestamp("b_date"));
					
					list.add(mdto);
					
				} while(rs.next());
				
				return list;
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
		
		return list;
	} // getMembers()
	
	
	// 로그인한 유저의 정보 가져오기
	public B_memberDTO getB_member(String id) {
		B_memberDTO mdto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from b_member where id=?";
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mdto = new B_memberDTO();
					
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					mdto.setEmail(rs.getString("email"));
					mdto.setAddress(rs.getString("address"));
					mdto.setB_date(rs.getTimestamp("b_date"));
					
				} while(rs.next());
				
				return mdto;
				
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
		
		return mdto;
	} // getB_member();
	
	
	
	
	// 로그인 - 아이디 패스워드 체크 메소드
	public int userCheck(String id, String pw) {
		int check = 0; // DB에서 결과 리턴값.
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String sql = "select id, pw from b_member where id=?";
		String ch_id, ch_pw;
		
		
		try {
			Context context = null;
			DataSource ds = null;
			
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 데이터가 있는 경우
				do {
					ch_id = rs.getString("id");
					ch_pw = rs.getString("pw");

					if(ch_pw.equals(pw)) {
						check = 1;	// 패스워드 일치
					}
					else {
						check = 0;	// 패스워드 불일치
					}
				}while(rs.next());
			}
			else {
				System.out.println("로그인 대상에 DB값이 존재하지 않음");
				check = -1;	// id가 존재하지 않음
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

		return check;
	} //userCheck
	
} //class
