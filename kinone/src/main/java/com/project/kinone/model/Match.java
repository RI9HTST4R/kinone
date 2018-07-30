package com.project.kinone.model;

import java.sql.Timestamp;

public class Match {

	private String mcode;
	private String lcode;
	private Timestamp mdate;
	private String mround;
	private int mstatus;
	private String ccode_home;
	private String ccode_away;
	private int homescore;
	private int awayscore;
	/* 여기까지 매치 테이블 컬럼 */
	
	/*여기부터 메인페이지 매치 일정 목록에서 사용하는 프로퍼티*/
	private String cname_short_h; // 홈팀 명
	private String emblem_h;	  // 홈팀 엠블럼
	private String cname_short_a; // 어웨이팀 명
	private String emblem_a;	  // 어웨이팀 엠블럼
	
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public Timestamp getMdate() {
		return mdate;
	}
	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
	public String getMround() {
		return mround;
	}
	public void setMround(String mround) {
		this.mround = mround;
	}
	public int getMstatus() {
		return mstatus;
	}
	public void setMstatus(int mstatus) {
		this.mstatus = mstatus;
	}
	public String getCcode_home() {
		return ccode_home;
	}
	public void setCcode_home(String ccode_home) {
		this.ccode_home = ccode_home;
	}
	public String getCcode_away() {
		return ccode_away;
	}
	public void setCcode_away(String ccode_away) {
		this.ccode_away = ccode_away;
	}
	public int getHomescore() {
		return homescore;
	}
	public void setHomescore(int homescore) {
		this.homescore = homescore;
	}
	public int getAwayscore() {
		return awayscore;
	}
	public void setAwayscore(int awayscore) {
		this.awayscore = awayscore;
	}
	public String getCname_short_h() {
		return cname_short_h;
	}
	public void setCname_short_h(String cname_short_h) {
		this.cname_short_h = cname_short_h;
	}
	public String getEmblem_h() {
		return emblem_h;
	}
	public void setEmblem_h(String emblem_h) {
		this.emblem_h = emblem_h;
	}
	public String getCname_short_a() {
		return cname_short_a;
	}
	public void setCname_short_a(String cname_short_a) {
		this.cname_short_a = cname_short_a;
	}
	public String getEmblem_a() {
		return emblem_a;
	}
	public void setEmblem_a(String emblem_a) {
		this.emblem_a = emblem_a;
	}
	
	@Override
	public String toString() {
		return "Match [mcode=" + mcode + ", lcode=" + lcode + ", mdate=" + mdate + ", mround=" + mround + ", mstatus="
				+ mstatus + ", ccode_home=" + ccode_home + ", ccode_away=" + ccode_away + ", homescore=" + homescore
				+ ", awayscore=" + awayscore + ", cname_short_h=" + cname_short_h + ", emblem_h=" + emblem_h
				+ ", cname_short_a=" + cname_short_a + ", emblem_a=" + emblem_a + "]";
	}
	
}
