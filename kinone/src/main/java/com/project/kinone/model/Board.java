package com.project.kinone.model;

import java.sql.Timestamp;

public class Board {
	private int bno;
	private String subject;
	private String image;
	private String content;
	private Timestamp regidate;
	private int readcount;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegidate() {
		return regidate;
	}
	public void setRegidate(Timestamp regidate) {
		this.regidate = regidate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	@Override
	public String toString() {
		return "Board [bno=" + bno + ", subject=" + subject + ", image=" + image + ", content=" + content
				+ ", regidate=" + regidate + ", readcount=" + readcount + "]";
	}
	
	
}
