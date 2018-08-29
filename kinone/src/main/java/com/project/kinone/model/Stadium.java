package com.project.kinone.model;

public class Stadium {

	private String ccode;
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
		return "Stadium [ccode=" + ccode + ", sname=" + sname + ", capacity=" + capacity
				+ ", lat=" + lat + ", lon=" + lon + "]";
	}
	
	
}
