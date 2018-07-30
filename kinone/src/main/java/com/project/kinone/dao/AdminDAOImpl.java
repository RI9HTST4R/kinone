package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Match;

@Repository
public class AdminDAOImpl {

	@Autowired
	private SqlSessionTemplate session;
	
	// 등록된 모든 리그 리스트 가져옴
	public List<String> getAllLeague() {
		return session.selectList("adminmapper.allLeague");
	}
	
	// 가장 높은 리그
	public String getTopLeague() {
		return session.selectOne("adminmapper.topLeague");
	}
	
	// 등록된 모든 시즌 리스트 가져옴
	public List<String> getAllSeason() {
		return session.selectList("adminmapper.allSeason");
	}
	
	// 가장 최근의 시즌
	public String getTopSeason() {
		return session.selectOne("adminmapper.topSeason");
	}
	
	// 넘겨진 구단 코드 리스트를 등록된 구단 목록에서 검색하여 그 갯수 가져옴
	public int checkClub(List<String> list) {
		return session.selectOne("adminmapper.checkClub", list);
	}
	
	// 다수의 매치 리스트를 db에 입력(match, match_detail 두 테이블 모두에)
	public int insertMatch(List<Match> matchList) {
	//	System.out.println("입력하는 매치일정 갯수 : " + matchList.size());
		int result = session.insert("adminmapper.insertMatch", matchList) / 2;
		return result;
	}
	
	// 매치 날짜 변경
	public int changeMdate(HashMap map) {
		session.update("adminmapper.changeMdate", map);
		return 0;
	}

	// 모든 매치 리스트
	public List<Match> allMatchList() {
		return session.selectList("adminmapper.allMatchList");
	}
	
	// 매치 검색(키워드는 HashMap에 저장)
	public List<Match> searchMatchList(HashMap<String, String> keyword) {
		return session.selectList("adminmapper.searchMatchList", keyword);
	}

	

	

	

	
}
