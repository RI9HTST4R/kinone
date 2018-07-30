package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import com.project.kinone.model.Player;

public interface PlayerDAOInter {
	
	public List<Player> getPlayerSeasonRankList(HashMap map);
}
