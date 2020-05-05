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
	ResultSet rs =null;
	
	String sql=null;
	
	ArrayList<BDTO> list = new ArrayList<BDTO>();
	BDTO bdto = null;
	
	int bId;
	String bName;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;
	int bGroup;
	int bStep;
	int bIndent;
	
	// 생성자
	public BDAO() {
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	// 전체 select - list
	public ArrayList<BDTO> list(int page, int limit) {
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		//sql = "select * from mvc_board order by bGroup desc, bStep asc";
		sql = "select * from " +
			   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
			   "(select * from mvc_board m order by bGroup desc, bId asc)" +
			   ")" +
			   "where rnum >=? and rnum<=?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			
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
					
					bdto = new BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
					list.add(bdto);
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
		return list;
	} // list();
	
	//
	public int getlistCount() {
		int count = 0;
		
		sql = "select count(*) as count from mvc_board";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					count = rs.getInt("count");
				}while(rs.next());
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
		return count;
	} //getListCount();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} //class
