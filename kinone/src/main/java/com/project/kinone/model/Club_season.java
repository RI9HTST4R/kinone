package com.project.kinone.model;

public class Club_season {
	private String ccode;
	private String seasoncode;
	private String lcode;
	private int win;
	private int draw;
	private int lose;
	private int c_ggoal;
	private int c_lgoal;
	
	private String cname_short;
	private String emblem;
	
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getSeasoncode() {
		return seasoncode;
	}
	public void setSeasoncode(String seasoncode) {
		this.seasoncode = seasoncode;
	}
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getC_ggoal() {
		return c_ggoal;
	}
	public void setC_ggoal(int c_ggoal) {
		this.c_ggoal = c_ggoal;
	}
	public int getC_lgoal() {
		return c_lgoal;
	}
	public void setC_lgoal(int c_lgoal) {
		this.c_lgoal = c_lgoal;
	}
	public String getCname_short() {
		return cname_short;
	}
	public void setCname_short(String cname_short) {
		this.cname_short = cname_short;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}
	
	@Override
	public String toString() {
		return "Club_season [ccode=" + ccode + ", seasoncode=" + seasoncode + ", lcode=" + lcode + ", win=" + win
				+ ", draw=" + draw + ", lose=" + lose + ", c_ggoal=" + c_ggoal + ", c_lgoal=" + c_lgoal
				+ ", cname_short=" + cname_short + ", emblem=" + emblem + "]";
	}
}
