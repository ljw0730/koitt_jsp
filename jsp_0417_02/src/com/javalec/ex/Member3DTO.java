package com.javalec.ex;

import java.sql.Timestamp;

public class Member3DTO {
	
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
	
	public Member3DTO() {
		
	}
	
	public Member3DTO(int m_num, String id, String pw, String name, String email, String address,
						String phone, Timestamp birth, String gender, 
						String news, String sms, Timestamp join_date) {
		this.m_num = m_num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.news = news;
		this.sms = sms;
		this.join_date = join_date;
		
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNews() {
		return news;
	}

	public void setNews(String news) {
		this.news = news;
	}

	public String getSms() {
		return sms;
	}

	public void setSms(String sms) {
		this.sms = sms;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	
	
}
