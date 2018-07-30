package com.project.kinone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.project.kinone.model.Match;

public interface MatchDAOInter {
	
	public Date getMiddleDay(String lcode);

	public List<Date> get7MatchDays(HashMap map);
	
	public int getTotalMcount(HashMap map);
	
	public List<Match> getMatchInDay(HashMap map);
}
