package com.project.kinone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.kinone.model.Player;

@Service
public interface PlayerServiceInter {
	
	public List<Player> getPlayerSeasonRankList(String seasoncode, String lcode, String sort, int rownum);
}
