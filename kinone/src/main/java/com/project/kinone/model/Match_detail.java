package com.project.kinone.model;

public class Match_detail {

	private String mcode;
	private String homelineup;
	private String awaylineup;
	
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getHomelineup() {
		return homelineup;
	}
	public void setHomelineup(String homelineup) {
		this.homelineup = homelineup;
	}
	public String getAwaylineup() {
		return awaylineup;
	}
	public void setAwaylineup(String awaylineup) {
		this.awaylineup = awaylineup;
	}
	
	@Override
	public String toString() {
		return "Match_detail [mcode=" + mcode + ", homelineup=" + homelineup + ", awaylineup=" + awaylineup + "]";
	}
		
}
