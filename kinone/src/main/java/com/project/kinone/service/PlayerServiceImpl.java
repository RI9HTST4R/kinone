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
	@Override
	public List<Player> getPlayerSeasonRankList(String seasoncode, String lcode, String sort) {
		HashMap map = new HashMap();
		map.put("seasoncode", seasoncode);
		map.put("lcode", lcode);
		map.put("sort", sort);
		
		return playerDao.getPlayerSeasonRankList(map);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

}
