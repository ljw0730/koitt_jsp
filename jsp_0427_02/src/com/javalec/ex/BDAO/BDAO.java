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

	// 객체선언(커넥션 풀, DB접속, 데이터 담는데 필요한 변수)
	// 커넥션 풀 객체
	Context context = null;
	DataSource ds = null;

	// DB 접속 객체
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	String sql = null;

	// 데이터를 담는데 필요한 변수
	ArrayList<BDTO> dtos = new ArrayList<BDTO>();
	BDTO dto = new BDTO();
	
	int bId, bHit, bGroup, bStep, bIndent ;
	String bName, bTitle, bContent;
	Timestamp bDate;

	// 생성자 - 커넥션풀 연결(객체선언)
	public BDAO() {
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // BDAO()
	
	// 전체 list를 가져옴 (select)
	public ArrayList<BDTO> list() {
		
		sql = "select * from mvc_board order by bId desc";

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
					
					dto = new BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
					dtos.add(dto);
					
					
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
		
		
		return dtos;
	} // list()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
