package com.javalec.ex.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.DTO.Notice_BDTO;

public class Notice_BDAO {

	Context context = null;
	DataSource ds = null;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	Notice_BDTO nbdto = null;
	
	int bId;
	String bName;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;
	int bGroup;
	int bStep;
	int bIndent;
	
	static private Notice_BDAO instance = new Notice_BDAO();
	
	private Notice_BDAO() {
		
	}
	
	static public Notice_BDAO getInstance() {
		return instance;
	}
	
	
	private Connection getConnection() {
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
	
	// 테이블 전체값 가져오기
	public ArrayList<Notice_BDTO> notice_list(int page, int limit, String opt, String search) {
		ArrayList<Notice_BDTO> list = new ArrayList<Notice_BDTO>();
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		switch (opt) {
			case "":
				sql = "select * from " +
					   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
					   "(select * from mvc_board m order by bGroup desc, bId asc)" +
					   ")" +
					   "where rnum >=? and rnum<=?";
				break;
			case "all":
				sql = "select * from " +
					   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
					   "(select * from mvc_board m where bTitle like '%'||?||'%' or bContent like '%'||?||'%' order by bGroup desc, bId asc)" +
					   ")" +
					   "where rnum >=? and rnum<=?";
				break;
			case "tit":
				sql = "select * from " +
					   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
					   "(select * from mvc_board m where bTitle like '%'||?||'%' order by bGroup desc, bId asc)" +
					   ")" +
					   "where rnum >=? and rnum<=?";
				break;
			case "con":
				sql = "select * from " +
					   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
					   "(select * from mvc_board m where bContent like '%'||?||'%' order by bGroup desc, bId asc)" +
					   ")" +
					   "where rnum >=? and rnum<=?";
				break;
		}
		
		
		
		//sql = "select * from mvc_board order by bGroup desc, bStep asc";
//		sql = "select * from " +
//			   "(select rownum rnum, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from" +
//			   "(select * from mvc_board m order by bGroup desc, bId asc)" +
//			   ")" +
//			   "where rnum >=? and rnum<=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			switch (opt) {
				case "":
					pstmt.setInt(1, startrow);
					pstmt.setInt(2, endrow);
					break;
				case "all":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					pstmt.setString(2, search);
					pstmt.setInt(3, startrow);
					pstmt.setInt(4, endrow);
					break;
				case "tit":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					break;
				case "con":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					break;
			}
			
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
					
					nbdto = new Notice_BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
					list.add(nbdto);
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
	} // list()

	// 총 게시글 수 가져오기
	public int getlistcount(String opt, String search) {
		int count = 0;
		
		switch (opt) {
			case "":
				sql = "select count(*) as count from mvc_board";
				break;
			case "all":
				sql = "select count(*) as count from mvc_board where bTitle like '%'||?||'%' or bContent like '%'||?||'%'";
				break;
			case "tit":
				sql = "select count(*) as count from mvc_board where bTitle like '%'||?||'%'";
				break;
			case "con":
				sql = "select count(*) as count from mvc_board where bcontent like '%'||?||'%'";
				break;
	
		}
		
		//sql = "select count(*) as count from mvc_board";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			switch (opt) {
				case "":
					break;
				case "all":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					pstmt.setString(2, search);
					break;
				case "tit":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					break;
				case "con":
//					pstmt.setString(1, "%"+search+"%");
					pstmt.setString(1, search);
					break;
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					count = rs.getInt("count");
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
		
		return count;
	}
	
	// 게시판 번호에 맞은 정보들을 가져옴
	public Notice_BDTO contentView(int bId) {

		upHit(bId);
		
		sql = "select * from mvc_board where bId=?";
		
		try {
			con = getConnection();
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
					
					nbdto = new Notice_BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
					
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

			}
		}
		
		return nbdto;
	}
	
	// 조회수 1 올려주는 메소드
	public int upHit(int bId) {
		int check = 0;
		
		sql = "update mvc_board set bHit=bHit+1 where bId=?";
		
		try {
			con = getConnection();
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
				e2.printStackTrace();
			}
		}
		
		
		return check;
	}

	// 글쓰기 insert
	public int notice_write(String bName, String bTitle, String bContent) {
		int check = 0;
		
		sql = "insert into mvc_board values "
				+ "(mvc_board_seq.nextval , ?, ?, ?, "
				+ "sysdate, 0, mvc_board_seq.currval, 0, 0)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);

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
	
	// 글 지우기 delete
	public int notice_delete(int bId) {
		int check = 0;
		
		sql = "delete from mvc_board where bId=?";
		
		try {
			con = getConnection();
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
				e2.printStackTrace();
			}
		}
		return check;
	}

	//게시글 수정 view 페이지 - select
	public Notice_BDTO notice_modify_view(int bId) {
		
		sql = "select * from mvc_board where bId=?";
		
		try {
			con = getConnection();
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
					
					nbdto = new Notice_BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					
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
		
		
		return nbdto;
	}

	// 글 수정(modify) - update
	public int notice_modify(int bId, String bTitle, String bContent) {
		int check = 0;
		
		sql = "update mvc_board set bTitle=?, bContent=? where bId=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setInt(3, bId);
			
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

	// 답글 view 페이지 - select
	public Notice_BDTO notice_reply_view(int bId) {

		sql = "select * from mvc_board where bid=?";
		
		try {
			con = getConnection();
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
					
					nbdto = new Notice_BDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
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
		
		
		return nbdto;
	}

	// 답글 달기(reply) - insert
	public int reply(int bId, String bName, String bTitle, String bContent, int bGroup, int bStep, int bIndent) {
		int check = 0;
		
		// 답글 달려 있는 리스트 step 1씩 증가
		replyshape(bGroup, bStep);
		
		sql = "insert into mvc_board values(mvc_board_seq.nextval,?,?,?,sysdate,0,?,?,?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, bGroup);
			pstmt.setInt(5, bStep+1);
			pstmt.setInt(6, bIndent+1);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					rs.close();
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
	
	// 답글 step1 씩 증가
	public void replyshape(int bGroup, int bStep) {
		
		sql = "update mvc_board set bStep=bStep+1 where bGroup=? and bStep>?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bGroup);
			pstmt.setInt(2, bStep);
			
			
			pstmt.executeUpdate();
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
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
