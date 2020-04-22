package com.jabalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	// BoardDAO 객체 생성 - 싱글패턴 형식
	static BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {
		
	}
	
	// BoardDAO 객체 반환 - 싱글패턴 방식
	public static BoardDAO getInstance() {
		return instance;
	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context context = null;
	DataSource ds = null;
	
	BoardDTO bdto = null;
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
			
			return con;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	// b_board 테이블 전체 값 가져오기
	public ArrayList<BoardDTO> getBoards() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		sql = "select * from b_board order by b_num asc";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					bdto = new BoardDTO();
				
					bdto.setB_num(rs.getInt("b_num"));
					bdto.setB_title(rs.getString("b_title"));
					bdto.setB_content(rs.getString("b_content"));
					bdto.setB_user(rs.getString("b_user"));
					bdto.setB_file(rs.getString("b_file"));
					
					list.add(bdto);				
					
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
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	// 게시판번호에 맞는 정보 가져오기
	public BoardDTO getBoard(int b_num) {
		bdto = null;
		
		sql = "select * from b_board where b_num=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					bdto = new BoardDTO();
					
					bdto.setB_num(rs.getInt("b_num"));
					bdto.setB_title(rs.getString("b_title"));
					bdto.setB_content(rs.getString("b_content"));
					bdto.setB_user(rs.getString("b_user"));
					bdto.setB_file(rs.getString("b_file"));
					
				}while(rs.next());
				
				return bdto;
			}
			else {
				System.out.println("데이터 검색 실패");
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
		
		return bdto;
	}
	
	
	
	// insert 메소드
	public int insertBoard(BoardDTO bdto) {
		int check = 0;
		
		sql = "insert into b_board values " +
				" (b_board_seq.nextval, ?, ?, ?, ?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getB_title());
			pstmt.setString(2, bdto.getB_content());
			pstmt.setString(3, bdto.getB_user());
			pstmt.setString(4, bdto.getB_file());

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
	
	// 게시판 수정 저장
	public int updateBoard(BoardDTO bdto) {
		int check = 0;
		
		sql = "update b_board set b_title=?, b_content=?, b_file=? where b_num=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getB_title());
			pstmt.setString(2, bdto.getB_content());
			pstmt.setString(3, bdto.getB_file());
			pstmt.setInt(4, bdto.getB_num());

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
