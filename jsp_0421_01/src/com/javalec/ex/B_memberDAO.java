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
	
	// 객체선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	B_memberDTO mdto = null;
	String sql;
	
	// 커넥션 풀에서 1개의 커넥션을 가지고 오는 메소드
	private Connection getConnetcion() {
		Context context = null;
		DataSource ds = null;
		Connection con = null;
		
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// b_member 테이블 전체 값 가져오기
	public ArrayList<B_memberDTO> getMembers() {
		ArrayList<B_memberDTO> list = new ArrayList<B_memberDTO>();
		
		sql = "select * from b_member order by b_date desc";
		
		try {
			con = getConnetcion();
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
		
		sql = "select * from b_member where id=?";
		
		try {
			con = getConnetcion();
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
		String ch_id, ch_pw;

		sql = "select id, pw from b_member where id=?";
		
		try {
			con = getConnetcion();
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
	
	
	// 회원가입 시 아이디 중복 체크
	public int confirmId(String id) {
		int check = 0;
		
		sql = "select id from b_member where id=?";
		
		try {
			con = getConnetcion();	// Context에서 커넥션 가져오기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 중복 아이디가 존재
				do {
					check = 1;	// 아이디가 있을 때 1
										
				} while(rs.next());
			}
			else {
					check = 0;	// 아이디가 없을 때 0
				// 중복 아이디가 없음
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
	} // confirmId();
	
	// 회원가입 insert 메소드
	public int insertMember(B_memberDTO mdto) {
		int check = 0;
		
		sql = "insert into b_member(id, pw, name, email, address) values"
				+ " (?,?,?,?,?)";
		
		try {
			con = getConnetcion();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getAddress());
			
			check = pstmt.executeUpdate();	// 저장 1, 실패 0 리턴

			return check;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
	} //insertMember();
	
	
	// 회원정보 수정 update 메소드
	public int updateMember(B_memberDTO mdto) {
		int check = 0;
		
//		update b_member set 
//		pw='1111', name='짱구', email='a1@naver.com', address='가산동 제이플라츠', b_date=sysdate 
//		where id='hh111';
		
		sql = "update b_member set " + 
				"pw=?, name=?, email=?, address=?, b_date=sysdate " + 
				"where id=?";
		
		try {
			con = getConnetcion();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getPw());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getAddress());
			pstmt.setString(5, mdto.getId());
			
			check = pstmt.executeUpdate(); //저장성공 1, 실패 0
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
	} // updateMember();
	
	// 회원정보삭제 메소드
	public int deleteMember(String id) {
		int check = 0;

		sql = "delete from b_member where id=?";
		
		try {
			con = getConnetcion();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
	} // deleteMember();
	
	
	
} //class