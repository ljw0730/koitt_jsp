package com.javalec.ex.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.DTO.Event_BDTO;

public class Event_BDAO {

	Context context = null;
	DataSource ds = null;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	ArrayList<Event_BDTO> list = new ArrayList<Event_BDTO>();
	Event_BDTO ebdto = null;
	
	int eId;
	String eTitle;
	String eContent;
	Date eStartdate;
	Date eEnddate;
	String eTitleimg;
	String eContentimg;
	
	static private Event_BDAO instance = new Event_BDAO();
	
	public Event_BDAO() {
		
	}
	
	static public Event_BDAO getInstance() {
		return instance;
	}
	
	
	private Connection getConnection() {
		Connection con = null;
		
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// 이벤트 DB에 저장 (insert)
	public int event_write(String eTitle, String eContent, Date eStartdate, Date eEnddate, String eTitleimg, String eContentimg) {
		int check = 0;
		
		sql = "insert into mvc_event values "
				+"(mvc_event_seq.nextval, ?, ?, to_date(?), to_date(?), ?, ?)";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eTitle);
			pstmt.setString(2, eContent);
			pstmt.setDate(3, eStartdate);
			pstmt.setDate(4, eEnddate);
			pstmt.setString(5, eTitleimg);
			pstmt.setString(6, eContentimg);

			
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
	}
	
	// 리스트 전부 가져오기
	public ArrayList<Event_BDTO> event_list(int page, int limit) {
		ArrayList<Event_BDTO> list = new ArrayList<Event_BDTO>();
		
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		//sql = "select * from mvc_event order by eId desc";
		sql = "select * from " + 
				"(select rownum rnum, eId, eTitle, eContent, eStartdate, eEnddate, eTitleimg, eContentimg from " +
				"(select * from mvc_event m order by eId desc)" +
				") where rnum >=? and rnum<=?";
		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					eId = rs.getInt("eId");
					eTitle = rs.getString("eTitle");
					eContent = rs.getString("eContent");
					eStartdate = rs.getDate("eStartdate");
					eEnddate = rs.getDate("eEnddate");
					eTitleimg = rs.getString("eTitleimg");
					eContentimg = rs.getString("eContentimg");
					
					ebdto = new Event_BDTO(eId, eTitle, eContent, eStartdate, eEnddate, eTitleimg, eContentimg);
					
					list.add(ebdto);
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

	// 전체 게시글 수 가져오기
	public int getlistCount() {
		int count = 0;
		
		sql = "select count(*) as count from mvc_event";
		
		try {
			con = getConnection();
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
	}
	
	
	// eId에 맞춰 해당 글 에대한 내용들 가져오기
	public Event_BDTO eventContentView(int eId) {
		
		sql = "select * from mvc_event where eId=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					eId = rs.getInt("eId");
					eTitle = rs.getString("eTitle");
					eContent = rs.getString("eContent");
					eStartdate = rs.getDate("eStartdate");
					eEnddate = rs.getDate("eEnddate");
					eTitleimg = rs.getString("eTitleimg");
					eContentimg = rs.getString("eContentimg");
					
					ebdto = new Event_BDTO(eId, eTitle, eContent, eStartdate, eEnddate, eTitleimg, eContentimg);
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
		return ebdto;
	}

	// 이벤트 글 삭제
	public int event_delete(int eId) {
		int check = 0;
		
		sql = "delete mvc_event where eid=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eId);
			
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
	}

	// 이벤트 수정을 위해 eId에 맞는 정보를 가져옴
	public Event_BDTO eventModifyView(int eId) {
		
		sql = "select * from mvc_event where eId=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					eId = rs.getInt("eId");
					eTitle = rs.getString("eTitle");
					eContent = rs.getString("eContent");
					eStartdate = rs.getDate("eStartdate");
					eEnddate = rs.getDate("eEnddate");
					eTitleimg = rs.getString("eTitleimg");
					eContentimg = rs.getString("eContentimg");
					
					ebdto = new Event_BDTO(eId, eTitle, eContent, eStartdate, eEnddate, eTitleimg, eContentimg);
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
		
		
		return ebdto;
	}

	// 이벤트 수정
	public int event_modify(int eId, String eTitle, String eContent, Date eStartdate, Date eEnddate,
			String eTitleimg, String eContentimg) {

		int check = 0;
		
		sql = "update mvc_event set eTitle=?, eContent=?, eStartdate=?, eEnddate=?,"
				+ "eTitleimg=?, eContentimg=? where eId=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eTitle);
			pstmt.setString(2, eContent);
			pstmt.setDate(3, eStartdate);
			pstmt.setDate(4, eEnddate);
			pstmt.setString(5, eTitleimg);
			pstmt.setString(6, eContentimg);
			pstmt.setInt(7, eId);
			
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
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
