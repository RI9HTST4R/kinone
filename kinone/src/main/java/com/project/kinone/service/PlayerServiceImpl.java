package com.project.kinone.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.PlayerDAOImpl;
import com.project.kinone.model.Player;

@Service
public class PlayerServiceImpl implements PlayerServiceInter {

	@Autowired
	private PlayerDAOImpl playerDao;
	
	@Override
	public List<Player> getPlayerSeasonRankList(int seasoncode, String lcode, String sort) {
		HashMap map = new HashMap();
		map.put("seasoncode", seasoncode);
		map.put("lcode", lcode);
		map.put("sort", sort);
		
		return playerDao.getPlayerSeasonRankList(map);
	}

}
