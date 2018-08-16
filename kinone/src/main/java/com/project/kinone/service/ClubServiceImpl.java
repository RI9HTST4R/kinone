package com.project.kinone.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.ClubDAOImpl;
import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Reservation;
import com.project.kinone.model.Stadium;

@Service
public class ClubServiceImpl implements ClubServiceInter {

	@Autowired
	private ClubDAOImpl clubDao;

	@Override
	public List<Club> getClubList() {
		return clubDao.getClubList();
	}
	
	@Override
	public List<Club_season> getClubSeasonRankList(String seasoncode, String lcode) {
		HashMap map = new HashMap();
		map.put("seasoncode", seasoncode);
		map.put("lcode", lcode);
		
		return clubDao.getClubSeasonRankList(map);
	}

	public Club getClub(String club_code) {
		// TODO Auto-generated method stub
		return clubDao.getClub(club_code);
	}

	public Stadium getStadium(String ccode) {
		// TODO Auto-generated method stub
		return clubDao.getStadium(ccode);
	}

	public Reservation checkReserv(Reservation reservation) {
		// TODO Auto-generated method stub
		return clubDao.checkReserv(reservation);
	}

	public int insertReserve(List<Reservation> list) {
		// TODO Auto-generated method stub
		return clubDao.insertReserve(list);
	}

	public List<Reservation> getSeatsList(String mcode) {
		// TODO Auto-generated method stub
		return clubDao.getSeatsList(mcode);
	}

	public int getTickets(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return clubDao.getTickets(map);
	}

	
}
