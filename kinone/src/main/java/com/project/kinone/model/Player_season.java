package com.project.kinone.model;


public class Player_season {
	private int inputno;
	private String pcode;
	private String seasoncode;
	private String ccode;
	private int gamecount;
	private int p_lgoal;
	private int p_ggoal;
	private int p_assist;
	public int getInputno() {
		return inputno;
	}
	public void setInputno(int inputno) {
		this.inputno = inputno;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getSeasoncode() {
		return seasoncode;
	}
	public void setSeasoncode(String seasoncode) {
		this.seasoncode = seasoncode;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public int getGamecount() {
		return gamecount;
	}
	public void setGamecount(int gamecount) {
		this.gamecount = gamecount;
	}
	public int getP_lgoal() {
		return p_lgoal;
	}
	public void setP_lgoal(int p_lgoal) {
		this.p_lgoal = p_lgoal;
	}
	public int getP_ggoal() {
		return p_ggoal;
	}
	public void setP_ggoal(int p_ggoal) {
		this.p_ggoal = p_ggoal;
	}
	public int getP_assist() {
		return p_assist;
	}
	public void setP_assist(int p_assist) {
		this.p_assist = p_assist;
	}
	@Override
	public String toString() {
		return "Player_season [inputno=" + inputno + ", pcode=" + pcode + ", seasoncode=" + seasoncode + ", ccode="
				+ ccode + ", gamecount=" + gamecount + ", p_lgoal=" + p_lgoal + ", p_ggoal=" + p_ggoal + ", p_assist="
				+ p_assist + "]";
	}
}