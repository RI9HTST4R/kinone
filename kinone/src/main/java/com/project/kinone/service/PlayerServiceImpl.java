package com.project.kinone.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.PlayerDAOImpl;
import com.project.kinone.model.Player;
import com.project.kinone.model.Player_detail;

@Service
public class PlayerServiceImpl implements PlayerServiceInter {

	@Autowired
	private PlayerDAOImpl playerDao;
	
//////////////////////////////////////////////한 동 준 /////////////////////////////////////////////////////////
	
	// 선수들의 개인 순위(sort가 goal인지 assist인지에 따른)
	@Override
	public List<Player> getPlayerSeasonRankList(String seasoncode, String lcode, String sort, int rownum) {
		HashMap map = new HashMap();
		map.put("seasoncode", seasoncode);
		map.put("lcode", lcode);
		map.put("sort", sort);
		map.put("rownum", rownum);
		
		return playerDao.getPlayerSeasonRankList(map);
	}
	
	// 특정 구단에 속해있는 선수 목록을 가져온다
	public List<Player> getPlayerListInClub(String ccode) {
		return playerDao.getPlayerListInClub(ccode);
	}

	// 구단 별 선수들의 개인 순위(sort가 goal인지 assist인지에 따른)
	public List<HashMap<String, Object>> getPlayerSeasonRankMini(String seasoncode, String ccode, String sort, int rownum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seasoncode", seasoncode);
		map.put("ccode", ccode);
		map.put("sort", sort);
		map.put("rownum", rownum);
		
		return playerDao.getPlayerSeasonRankMini(map);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

}
