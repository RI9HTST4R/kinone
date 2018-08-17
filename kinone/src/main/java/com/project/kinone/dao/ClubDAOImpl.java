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

	// 현재 시즌의 클럽 정보
	public Club_season getClubSeasonInfo(HashMap<String, Object> map) {
		return session.selectOne("clubmapper.clubSeasonInfo", map);
	}
	
	// 클럽 랭크 리스트를 구하기 위한 현재 시즌 클럽의 순위
	public int getClubSeasonRank(HashMap<String, Object> map) {
		return session.selectOne("clubmapper.clubSeasonRank", map);
	}
	
	// 클럽 상세정보 페이지에 필요한 랭크 리스트(3개)
	public List<Club_season> getClubSeasonRankMini(HashMap<String, Object> map) {
		return session.selectList("clubmapper.clubSeasonRankMini", map);
	}


	

	

	

	

	
}
