package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Player;

@Repository
public class PlayerDAOImpl implements PlayerDAOInter {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Player> getPlayerSeasonRankList(HashMap map) {
		return session.selectList("playermapper.playerSeasonRankList", map);
	}
}
