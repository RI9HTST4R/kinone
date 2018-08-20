package com.project.kinone.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Match;
import com.project.kinone.model.Match_detail;

@Repository
public class MatchDAOImpl implements MatchDAOInter {

	@Autowired
	private SqlSessionTemplate session;
	
//////////////////////////////////////////////한 동 준 /////////////////////////////////////////////////////////
	
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

	public Match_detail getMatchDetail(String mcode) {
		return session.selectOne("matchmapper.matchDetail", mcode);
	}

	// 월 별 매치일 리스트 가져옴
	public List<Date> getMatchDaysInMonth(HashMap<String, String> map) {
		return session.selectList("matchmapper.matchDaysInMonth", map);
	}

	public List<Match> getMatchInMonth(HashMap<String, String> map) {
		return session.selectList("matchmapper.matchInMonth", map);
	}

	public Match get_the_match(String mcode) {
		// TODO Auto-generated method stub
		return session.selectOne("matchmapper.get_the_match", mcode);
	}

	// 해당 클럽의 이전 경기 결과
	public Match getPrevMatchInfo(HashMap<String, Object> map) {
		return session.selectOne("matchmapper.prevMatchInfo", map);
	}

	// 해당 클럽의 다음 경기 일정
	public Match getNextMatchInfo(HashMap<String, Object> map) {
		return session.selectOne("matchmapper.nextMatchInfo", map);
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
