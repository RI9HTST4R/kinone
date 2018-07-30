package com.project.kinone.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.ClubDAOImpl;
import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;

@Service
public class ClubServiceImpl implements ClubServiceInter {

	@Autowired
	private ClubDAOImpl clubDao;

	@Override
	public List<Club> getClubList() {
		return clubDao.getClubList();
	}
	
	@Override
	public List<Club_season> getClubSeasonRankList(int seasoncode, String lcode) {
		HashMap map = new HashMap();
		map.put("seasoncode", seasoncode);
		map.put("lcode", lcode);
		
		return clubDao.getClubSeasonRankList(map);
	}

	
}
