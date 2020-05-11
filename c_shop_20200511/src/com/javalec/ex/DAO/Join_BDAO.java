package com.javalec.ex.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.DTO.Join_BDTO;

public class Join_BDAO {

	Context context = null;
	DataSource ds = null;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	Join_BDTO jbdto = null;
	
	String id;
	String pw1;
	String name;
	String mail_id;
	String mail_tail;
	int f_postal;
	String address1;
	String address2;
	int f_tell;
	int m_tell;
	int l_tell;
	int birth_year;
	int birth_month;
	int birth_day;
	String calendar;
	String gender;
	String newsletter;
	String sms;
	int m_number;
	int v_number;
	String job;
	String marital_status;
	String computer;
	String movie;
	String music;
	String shopping;
	String game;
	String culture;
	String parenting;
	String cooking;
	String interier;
	String leisure;
	String health;
	String fashion;
	
	static private Join_BDAO instance = new Join_BDAO();
	
	private Join_BDAO() {
		
	}
	
	static public Join_BDAO getInstance() {
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
	
	public int join_insert(String id, String pw1, String name, String mail_id, String mail_tail,
							int f_postal, String address1, String address2, String f_tell, String m_tell,
							String l_tell, int birth_year, int birth_month, int birth_day, String calendar,
							String gender, String newsletter, String sms, String m_number, String v_number,
							String job, String marital_status, String computer, String movie, String music,
							String shopping, String game, String culture, String parenting, String cooking,
							String interier, String leisure, String health, String fashion) {
		int check = 0;
		
		sql = "insert into mvc_member (id, pw1, name, mail_id, mail_tail, f_postal, address1, address2, f_tell, m_tell, l_tell, birth_year, " +
				"birth_month, birth_day, calendar, gender, newsletter, sms, m_number, v_number, job, marital_status, computer, movie, music, " +
				"shopping, game, culture, parenting, cooking, interier, leisure, health, fashion)values " +
				"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw1);
			pstmt.setString(3, name);
			pstmt.setString(4, mail_id);
			pstmt.setString(5, mail_tail);
			pstmt.setInt(6, f_postal);
			pstmt.setString(7, address1);
			pstmt.setString(8, address2);
			pstmt.setString(9, f_tell);
			pstmt.setString(10, m_tell);
			pstmt.setString(11, l_tell);
			pstmt.setInt(12, birth_year);
			pstmt.setInt(13, birth_month);
			pstmt.setInt(14, birth_day);
			pstmt.setString(15, calendar);
			pstmt.setString(16, gender);
			pstmt.setString(17, newsletter);
			pstmt.setString(18, sms);
			pstmt.setString(19, m_number);
			pstmt.setString(20, v_number);
			pstmt.setString(21, job);
			pstmt.setString(22, marital_status);
			pstmt.setString(23, computer);
			pstmt.setString(24, movie);
			pstmt.setString(25, music);
			pstmt.setString(26, shopping);
			pstmt.setString(27, game);
			pstmt.setString(28, culture);
			pstmt.setString(29, parenting);
			pstmt.setString(30, cooking);
			pstmt.setString(31, interier);
			pstmt.setString(32, leisure);
			pstmt.setString(33, health);
			pstmt.setString(34, fashion);
			
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

	
	// 아이디 중복 확인
	public int id_check(String id) {
		int check = 0;
		
		sql = "select id from mvc_member where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}
			else {
				check = 0;
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
	
}
