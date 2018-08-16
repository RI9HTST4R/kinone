package com.project.kinone.model;

import java.sql.Timestamp;

public class Reservation {

	private String rcode; 
	private String mcode; 
	private String seatcode; 
	private Timestamp rdate; 
	private int mno; 
	private String ccode;
	
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getSeatcode() {
		return seatcode;
	}
	public void setSeatcode(String seatcode) {
		this.seatcode = seatcode;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	} 
}
