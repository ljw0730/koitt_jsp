package com.javalec.ex.DTO;

import java.sql.Date;
import java.sql.Timestamp;

public class Event_BDTO {
	private int eId;
	private String eTitle;
	private String eContent;
	private Date eStartdate;
	private Date eEnddate;
	private String eTitleimg;
	private String eContentimg;
	
	
	public Event_BDTO() {
		
	}
	
	public Event_BDTO(int eId, String eTitle, String eContent, Date eStartdate, Date eEnddate, String eTitleimg, String eContentimg) {
		this.eId = eId;
		this.eTitle = eTitle;
		this.eContent = eContent;
		this.eStartdate = eStartdate;
		this.eEnddate = eEnddate;
		this.eTitleimg = eTitleimg;
		this.eContentimg = eContentimg;
	}

	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public Date geteStartdate() {
		return eStartdate;
	}

	public void seteStartdate(Date eStartdate) {
		this.eStartdate = eStartdate;
	}

	public Date geteEnddate() {
		return eEnddate;
	}

	public void seteEnddate(Date eEnddate) {
		this.eEnddate = eEnddate;
	}

	public String geteTitleimg() {
		return eTitleimg;
	}

	public void seteTitleimg(String eTitleimg) {
		this.eTitleimg = eTitleimg;
	}

	public String geteContentimg() {
		return eContentimg;
	}

	public void seteContentimg(String eContentimg) {
		this.eContentimg = eContentimg;
	}
}
