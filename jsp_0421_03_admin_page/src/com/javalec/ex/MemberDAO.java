package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// MemberDAO 객체 생성 - 싱글패턴 방식
	static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {
		
	}
	
	// MemberDAO 객체 반환 - 싱글패턴 방식
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 객체 생성
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context context = null;
	DataSource ds = null;
	
	MemberDTO mdto = null;
	String sql;
	
	//커낵션 풀에서 1개의 커낵션을 가지고 오는 메소드
	private Connection getConnection() {
		Connection con = null;
		context = null;
		ds = null;
		
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	// 로그인 - 아이디 패스워드 체크 메소드
	public int userCheck(String id, String pw) {
		int check = 0;

		sql = "select id, pw from b_member2 where id=?";
		String ch_id, ch_pw;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					ch_id = rs.getString("id");
					ch_pw = rs.getString("pw");
					
					if(ch_pw.equals(pw)) {
						check = 1; // 패스워드 일치
					}
					else {
						check = 0; // 패스워드 불일치
					}
					
				} while(rs.next());
			}
			else {
				check = -1; // 아이디가 없음
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
	}
	
	// 로그인한 유저의 정보 가져오기
	public MemberDTO getMember(String id) {
		mdto = null;
		
		sql = "select * from b_member2 where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mdto = new MemberDTO();
					
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					mdto.setEmail(rs.getString("email"));
					mdto.setAddress1(rs.getString("address1"));
					mdto.setAddress2(rs.getString("address2"));
					mdto.setAddress3(rs.getString("address3"));
					mdto.setJoin_date(rs.getTimestamp("join_date"));
					mdto.setModify_date(rs.getTimestamp("modify_date"));
					
				} while(rs.next());
			}
			
			return mdto;
			
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
	}
	
	// b_member2 테이블 전체 값 가져오기
	public ArrayList<MemberDTO> getMembers() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		sql = "select * from b_member2 order by join_date desc";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mdto = new MemberDTO();
					
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					mdto.setEmail(rs.getString("email"));
					mdto.setAddress1(rs.getString("address1"));
					mdto.setAddress2(rs.getString("address2"));
					mdto.setAddress3(rs.getString("address3"));
					mdto.setJoin_date(rs.getTimestamp("join_date"));
					mdto.setModify_date(rs.getTimestamp("Modify_date"));
					
					list.add(mdto);
					
				} while(rs.next());
			}
			
			return list;
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
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;		
	}
	
	// 아이디 중복 체크를 위한 메소드
	public int id_check(String ch_id) {
		int check = 0;
		
		sql ="select id from b_member2 where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ch_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}
			else {
				check = 0;
			}
			
			return check;
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
	}
	
	// 회원가입 insert 메소드
	public int insertMember(MemberDTO mdto) {
		int check = 0;
		
		sql = "insert into b_member2(id, pw, name, email, address1, address2, address3, join_date) values "
				+ "(?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getAddress1());
			pstmt.setString(6, mdto.getAddress2());
			pstmt.setString(7, mdto.getAddress3());
			
			check = pstmt.executeUpdate();
			//저장 1, 실패 0 리턴
			
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
	}
	
	
	// 회원정보수정 update
	public int updateMember(MemberDTO mdto) {
		int check = 0;
		
		sql = "update b_member2 set " +
				"pw=?, name=?, email=?, address1=?, address2=?, address3=?, modify_date=sysdate " +
				"where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getPw());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getAddress1());
			pstmt.setString(5, mdto.getAddress2());
			pstmt.setString(6, mdto.getAddress3());
			pstmt.setString(7, mdto.getId());
			
			check = pstmt.executeUpdate();
			
			return check;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		return check;
	}
	
	
	// 회원정보삭제
	public int deleteMember(String id) {
		int check = 0;
		
		sql = "delete from b_member2 where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			check = pstmt.executeUpdate();
			
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
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
