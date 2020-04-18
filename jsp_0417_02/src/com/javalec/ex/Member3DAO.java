package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Member3DAO {

	ArrayList<Member3DTO> list = new ArrayList<Member3DTO>();
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	DataSource dataSource;
	
	int m_num;
	String id;
	String pw;
	String name;
	String email;
	String address;
	String phone;
	Timestamp birth;
	String gender;
	String news;
	String sms;
	Timestamp join_date;
	
	String sql;
	
	public Member3DAO () {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Member3DTO> member_Select() {
		try {
			sql = "select * from member3";
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				do {
					m_num = rs.getInt("m_num");
					id = rs.getString("id");
					pw = rs.getString("pw");
					name = rs.getString("name");
					email = rs.getString("email");
					address = rs.getString("address");
					phone = rs.getString("phone");
					birth = rs.getTimestamp("birth");
					gender = rs.getString("gender");
					news = rs.getString("news");
					sms = rs.getString("sms");
					join_date = rs.getTimestamp("join_date");
					
					Member3DTO m3dto = new Member3DTO(m_num, id, pw, name, email, 
													address, phone, birth, gender, 
													news, sms, join_date);
					
					list.add(m3dto);
				} while(rs.next());
				return list;
			}
			else {
				System.out.println("Member3에 데이터가 없습니다.");
				return null;
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
	
	public int member_insert(String id, String pw, String name, String email, String address, 
								String phone, String birth, String gender, String news, String sms) {
		int check = 0;
		try {
			
			con = dataSource.getConnection();
			
			sql = "insert into member3(m_num, id, pw, name, email, address, phone, birth, gender, news, sms) values"
					+ "(m3_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, birth);
			pstmt.setString(8, gender);
			pstmt.setString(9, news);
			pstmt.setString(10, sms);
			
			System.out.println(gender);
			System.out.println(news);
			System.out.println(sms);

			check = pstmt.executeUpdate();
			if(check == 1) {
				return 1;
			}
			else {
				return 0;
			}
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
