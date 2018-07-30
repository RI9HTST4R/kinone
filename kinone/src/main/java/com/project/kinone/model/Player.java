package com.project.kinone.model;

public class Player {
	private String pcode;
	private String ccode;
	private String pno;
	private String pname;
	private String position;
	private String photo;
	/*	여기까지 기본 player 테이블 컬럼*/
	
	/* 메인페이지에 선수 순위 노출 위한 데이터 */
	private int rownum;
	private String cname_short;
	private String emblem;
	private int gamecount;
	private int p_ggoal;
	private int p_assist;
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
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
	public int getGamecount() {
		return gamecount;
	}
	public void setGamecount(int gamecount) {
		this.gamecount = gamecount;
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
		return "Player [pcode=" + pcode + ", ccode=" + ccode + ", pno=" + pno + ", pname=" + pname + ", position="
				+ position + ", photo=" + photo + ", rownum=" + rownum + ", cname_short=" + cname_short + ", emblem="
				+ emblem + ", gamecount=" + gamecount + ", p_ggoal=" + p_ggoal + ", p_assist=" + p_assist + "]";
	}
	
	
}
