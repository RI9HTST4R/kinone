package com.project.kinone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Match;

@Repository
public class MatchDAOImpl implements MatchDAOInter {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Date getMiddleDay(String lcode) {
		Date middleDay = session.selectOne("matchmapper.middleDay", lcode);
		return middleDay;
	}

	@Override
	public List<Date> get7MatchDays(HashMap map) {
		return session.selectList("matchmapper.7MatchDays", map);
	}

	@Override
	public int getTotalMcount(HashMap map) {
		return session.selectOne("matchmapper.totalMcountInDay", map);
	}
	
	@Override
	public List<Match> getMatchInDay(HashMap map) {
		return session.selectList("matchmapper.matchInDay", map);
	}

}
