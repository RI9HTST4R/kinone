package com.project.kinone.model;

public class ManagerClub {
	// 구단 생성
	private String ccode;
	private String cname;
	private String cname_short;
	private String cmanager;
	private String emblem;
	private int isbeing;
	
	// 경기장 생성
	private String sname;
	private String sphoto;
	private int capacity;
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSphoto() {
		return sphoto;
	}
	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String getCname_short() {
		return cname_short;
	}
	public void setCname_short(String cname_short) {
		this.cname_short = cname_short;
	}
	public String getCmanager() {
		return cmanager;
	}
	public void setCmanager(String cmanager) {
		this.cmanager = cmanager;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}
	public int getIsbeing() {
		return isbeing;
	}
	public void setIsbeing(int isbeing) {
		this.isbeing = isbeing;
	}
}
