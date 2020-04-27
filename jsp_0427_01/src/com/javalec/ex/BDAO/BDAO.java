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
	
	// 싱글패턴 방식
	
//	private BDAO() {
//		
//	}
//	
//	static private BDAO instance = new BDAO();
//	
//	// 싱글톤 패턴
//	static public BDAO getInstance() {
//		return instance;
//	}
//	
//	public Connection getConnection() {
//		Connection con = null;
//		
//		Context context = null;
//		DataSource ds = null;
//		
//		try {
//			context = new InitialContext();
//			ds = (DataSource)context.lookup("java:comp.env.jdbc.Oracle11g");
//			con = ds.getConnection();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return con;
//	}

	
	///////////////////////////////////////
	// 일반적인 방식
	
	Context context = null;
	DataSource ds = null;
	Connection con = null;
	
	//객체선언
	ArrayList<BDTO> list = new ArrayList<BDTO>();
	BDTO bdto = new BDTO();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql;
	
	int bId, bHit, bGroup, bStep, bIndent;
	String bName, bTitle, bContent;
	Timestamp bDate;
	
	public BDAO() {
		
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // 생성자
	
	// 전체 select
	public ArrayList<BDTO> list() {
		
		sql = "select * from mvc_board";
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
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
					
					System.out.println(bId);
					System.out.println(bName);
					System.out.println(bTitle);
					System.out.println(bContent);
					System.out.println(bDate);
					System.out.println(bHit);
					System.out.println(bGroup);
					System.out.println(bStep);
					System.out.println(bIndent);
					
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
	}
	
	
}
