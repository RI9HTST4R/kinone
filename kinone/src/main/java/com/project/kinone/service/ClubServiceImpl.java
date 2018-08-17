package com.project.kinone.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.kinone.dao.ClubDAOImpl;
import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
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

	// 클럽 상세정보 페이지에 필요한 랭크 리스트(3개)
	@Transactional
	public List<Club_season> getClubSeasonRankMini(String ccode, String seasoncode) {
		// 클럽 코드와 시즌 코드로 리그 코드 구하고, 순위 구해서 알맞는 3개순위 정보 가져오기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ccode", ccode);
		map.put("seasoncode", seasoncode);
		Club_season cs = clubDao.getClubSeasonInfo(map);
		map.put("lcode", cs.getLcode());
		int rno = clubDao.getClubSeasonRank(map);
		int start = 0;
		int end = 0;
		if(rno == 1) {
			start = 1;
			end = 3;
		}else if(cs.getLcode().equals("K1") && rno == 12) {
			start = 9;
			end = 12;
		}else if(cs.getLcode().equals("K2") && rno == 10) {
			start = 8;
			end = 10;
		}else {
			start = rno - 1;
			end = rno + 1;
		}
		map.put("start", start);
		map.put("end", end);
		
		return clubDao.getClubSeasonRankMini(map);
	}

	
}
