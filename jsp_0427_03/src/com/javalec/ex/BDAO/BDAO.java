package com.javalec.ex.BDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.BDTO.BDTO;

public class BDAO {

	Context context = null;
	DataSource ds = null;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	BDTO dto = null; 
	
	int bId;
	String bName;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;
	int bGroup;
	int bStep;
	int bIndent;
	
	
	
	
	public BDAO( ) {
		
		try {
			
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<BDTO> list() {
		
		ArrayList<BDTO> dtos = new ArrayList<BDTO>();
		
		BDTO dto = null; 
		
		sql = "select * from mvc_board order by bId desc";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = null;
				do {
					bId = rs.getInt("bId");
					bName = rs.getString("bName");
					bTitle = rs.getString("bTitle");
					bContent = rs.getString("bContent");
					bDate = rs.getTimestamp("bDate");
					bHit = rs.getInt("bHit");
					bGroup = rs.getInt("bGroup");
					bStep = rs.getInt("bStep");
					bIndent = rs.getInt("bIndent");
					
					dto = new BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
					dtos.add(dto);
					
				} while(rs.next());
				
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
		
	} // 전체 select
	
	
	// 1개 select - contentView
	public BDTO contentView(int bId) {
		
		// 조회수 1증가
		// update mvc_board set bHit = bHit+1 where bid = 1;
		// 
		
		upHit(bId);
		
		sql = "select * from mvc_board where bId=?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					bId = rs.getInt("bId");
					bName = rs.getString("bName");
					bTitle = rs.getString("bTitle");
					bContent = rs.getString("bContent");
					bDate = rs.getTimestamp("bDate");
					bHit = rs.getInt("bHit");
					bGroup = rs.getInt("bGroup");
					bStep = rs.getInt("bStep");
					bIndent = rs.getInt("bIndent");
					
					dto = new BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
				} while(rs.next());
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
		
		return dto;
	} // 1개 select - contentView
	
	// 조회수 1증가
	public int upHit(int bId) {
		int check = 0;
		
		sql = "update mvc_board set bHit = bHit+1 where bId = ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
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
				// TODO: handle exception
			}
		}
		return check;
	} // 조회수 1증가 - upHit
	
	
	
	
	
} // BDAO
