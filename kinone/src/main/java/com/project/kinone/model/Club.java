package com.project.kinone.model;

public class Club {
	private String ccode;
	private String cname;
	private String cname_short;
	private String cmanager;
	private String emblem;
	private String intro;
	private int isbeing;
	// 경기장 생성
	private String sname;
	private int capacity;
	private double lat; // 위도
	private double lon; // 경도
	
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getIsbeing() {
		return isbeing;
	}
	public void setIsbeing(int isbeing) {
		this.isbeing = isbeing;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	@Override
	public String toString() {
		return "Club [ccode=" + ccode + ", cname=" + cname + ", cname_short=" + cname_short + ", cmanager=" + cmanager
				+ ", emblem=" + emblem + ", intro=" + intro + ", isbeing=" + isbeing + ", sname=" + sname + 
				", capacity=" + capacity + ", lat=" + lat + ", lon=" + lon + "]";
	}
	
	
	
}
