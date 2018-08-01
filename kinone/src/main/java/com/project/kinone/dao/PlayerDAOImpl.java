package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Player;
import com.project.kinone.model.Player_detail;

@Repository
public class PlayerDAOImpl implements PlayerDAOInter {

	@Autowired
	private SqlSessionTemplate session;
	
//////////////////////////////////////////////한 동 준 /////////////////////////////////////////////////////////
	
	@Override
	public List<Player> getPlayerSeasonRankList(HashMap map) {
		return session.selectList("playermapper.playerSeasonRankList", map);
	}

	public List<Player> getPlayerList(String[] pcode) {
		return session.selectList("playermapper.playerList", pcode);
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

}
