package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;

public interface ClubDAOInter {

	public List<Club> getClubList();
	
	public List<Club_season> getClubSeasonInfoList(HashMap map);
}
