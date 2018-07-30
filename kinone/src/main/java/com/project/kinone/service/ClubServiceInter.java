package com.project.kinone.service;

import java.util.List;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;

public interface ClubServiceInter {

	public List<Club> getClubList();
	
	public List<Club_season> getClubSeasonRankList(int seasoncode, String lcode);
}
