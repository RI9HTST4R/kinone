package com.project.kinone.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.kinone.dao.PlayerDAOImpl;
import com.project.kinone.model.Match_detail;
import com.project.kinone.model.Player;

public class Lineup {
	private List<Player> hStarting;
	private List<Player> hSubstitute;
	private List<Player> aStarting;
	private List<Player> aSubstitute;
	
	public Lineup(PlayerDAOImpl dao, Match_detail md) {
		
		String home = md.getHomelineup();
		System.out.println("home:"+home);
		if(home != null) {
			String homearr[] = home.split("/");
			List<Player> hStarting = dao.getPlayerList(homearr[0].split(","));
			List<Player> hSubstitute = dao.getPlayerList(homearr[1].split(","));
			
			this.hStarting = hStarting;
			this.hSubstitute = hSubstitute;
		}
		
		String away = md.getAwaylineup();
		System.out.println("away:"+away);
		if(away != null) {
			String awayarr[] = away.split("/");
			List<Player> aStarting = dao.getPlayerList(awayarr[0].split(","));
			List<Player> aSubstitute = dao.getPlayerList(awayarr[1].split(","));
			
			this.aStarting = aStarting;
			this.aSubstitute = aSubstitute;
		}
	}

	public List<Player> gethStarting() {
		return hStarting;
	}

	public void sethStarting(List<Player> hStarting) {
		this.hStarting = hStarting;
	}

	public List<Player> gethSubstitute() {
		return hSubstitute;
	}

	public void sethSubstitute(List<Player> hSubstitute) {
		this.hSubstitute = hSubstitute;
	}

	public List<Player> getaStarting() {
		return aStarting;
	}

	public void setaStarting(List<Player> aStarting) {
		this.aStarting = aStarting;
	}

	public List<Player> getaSubstitute() {
		return aSubstitute;
	}

	public void setaSubstitute(List<Player> aSubstitute) {
		this.aSubstitute = aSubstitute;
	}

	@Override
	public String toString() {
		return "Lineup [hStarting=" + hStarting + ", hSubstitute=" + hSubstitute + ", aStarting=" + aStarting
				+ ", aSubstitute=" + aSubstitute + "]";
	}
	
}
