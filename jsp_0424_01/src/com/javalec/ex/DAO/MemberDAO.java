package com.javalec.ex.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.DTO.MemberDTO;

public class MemberDAO {
	
	static private MemberDAO instance = new MemberDAO(); 
	
	private MemberDAO() {
		
	}
	
	static public MemberDAO getInstance() {
		return instance;
	}
	
	// 객체선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context context = null;
	DataSource ds = null;
	
	MemberDAO mdao = null;
	MemberDTO mdto = null;
	
	String sql = null;
	
	// 커낵션 풀에서 1개의 connection을 가져오는 메소드
	private Connection getConnection() {
		Connection con = null;
		
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			con = ds.getConnection();
			
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	} //getConnection();
	
	
	// select 전체
	public ArrayList<MemberDTO> getMembers() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		sql = "select * from b_member order by b_date desc";
		
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
					mdto.setAddress(rs.getString("address"));
					mdto.setB_date(rs.getTimestamp("b_date"));
					
					list.add(mdto);
				}while(rs.next());
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
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} 
		
		return list;
	} //getMembers()
	
} //class
