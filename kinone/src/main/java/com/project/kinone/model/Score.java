package com.project.kinone.model;

public class Score {
	private int scoreno;
	private String mcode;
	private String ccode;
	private String pcode;
	private String pname;
	private int goaltime;
	private String isas;
	private String asname;
	
	// 상대 팀의 골키퍼 pcode
	private String gkcode;

	public int getScoreno() {
		return scoreno;
	}

	public void setScoreno(int scoreno) {
		this.scoreno = scoreno;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getGoaltime() {
		return goaltime;
	}

	public void setGoaltime(int goaltime) {
		this.goaltime = goaltime;
	}

	public String getIsas() {
		return isas;
	}

	public void setIsas(String isas) {
		this.isas = isas;
	}

	public String getAsname() {
		return asname;
	}

	public void setAsname(String asname) {
		this.asname = asname;
	}

	public String getGkcode() {
		return gkcode;
	}

	public void setGkcode(String gkcode) {
		this.gkcode = gkcode;
	}

	@Override
	public String toString() {
		return "Score [scoreno=" + scoreno + ", mcode=" + mcode + ", ccode=" + ccode + ", pcode=" + pcode + ", pname="
				+ pname + ", goaltime=" + goaltime + ", isas=" + isas + ", asname=" + asname + ", gkcode=" + gkcode
				+ "]";
	}
}
