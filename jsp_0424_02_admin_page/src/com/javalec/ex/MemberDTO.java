package com.javalec.ex;

import java.sql.Timestamp;

public class MemberDTO {

	String id;
	String pw;
	String name;
	String email;
	String address1;
	String address2;
	String address3;
	Timestamp join_date;
	Timestamp modify_date;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String id, String pw, String name, String email, String address1, String address2, String address3,
				Timestamp join_date, Timestamp modify_date) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.join_date = join_date;
		this.modify_date = modify_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public Timestamp getModify_date() {
		return modify_date;
	}

	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	
		
}
