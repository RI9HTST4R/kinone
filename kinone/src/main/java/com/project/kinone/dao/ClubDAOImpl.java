package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Reservation;
import com.project.kinone.model.Stadium;

@Repository
public class ClubDAOImpl implements ClubDAOInter {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Club> getClubList() {
		return session.selectList("clubmapper.clubList");
	}
	
	@Override
	public List<Club_season> getClubSeasonRankList(HashMap map) {
		return session.selectList("clubmapper.clubSeasonRankList", map);
	}

	public Club getClub(String club_code) {
		// TODO Auto-generated method stub
		return session.selectOne("clubmapper.getClub", club_code);
	}

	public Stadium getStadium(String ccode) {
		// TODO Auto-generated method stub
		return session.selectOne("clubmapper.getStadium", ccode);
	}

	public Reservation checkReserv(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.selectOne("clubmapper.checkReserv", reservation);
	}

	public int insertReserve(List<Reservation> list) {
		// TODO Auto-generated method stub
		return session.insert("clubmapper.insertReserve", list);
	}

	public List<Reservation> getSeatsList(String mcode) {
		// TODO Auto-generated method stub
		return session.selectList("clubmapper.getSeatsList", mcode);
	}

	public int getTickets(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("clubmapper.getTickets", map);
	}

	
}
