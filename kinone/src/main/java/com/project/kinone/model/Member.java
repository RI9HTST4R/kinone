package com.project.kinone.model;

import java.sql.Timestamp;

public class Member {
	private int mno;
	private String email;
	private String mname;
	private String passwd;
	private Timestamp mbirthdate;
	private int mstatus;

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Timestamp getMbirthdate() {
		return mbirthdate;
	}

	public void setMbirthdate(Timestamp mbirthdate) {
		this.mbirthdate = mbirthdate;
	}

	public int getMstatus() {
		return mstatus;
	}

	public void setMstatus(int mstatus) {
		this.mstatus = mstatus;
	}

}
