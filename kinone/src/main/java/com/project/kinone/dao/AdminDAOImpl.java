package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Club;
import com.project.kinone.model.Match;
import com.project.kinone.model.Match_detail;
import com.project.kinone.model.Player;
import com.project.kinone.model.Player_detail;
import com.project.kinone.model.Player_season;

@Repository
public class AdminDAOImpl implements AdminDAOInter {

	@Autowired
	private SqlSessionTemplate session;

	////////////////////////////////////////////// 한 동 준
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	
	// 시즌 추가
	public int addSeason(String seasoncode) {
		return session.insert("adminmapper.addSeason", seasoncode);
	}
	
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
		// System.out.println("입력하는 매치일정 갯수 : " + matchList.size());
		int result = session.insert("adminmapper.insertMatch", matchList) / 2;
		return result;
	}

	// 처음 혹은 검색된 매치 리스트의 총 갯수
	public int getMatchListCount(HashMap<String, String> keyword) {
		return session.selectOne("adminmapper.matchListCount", keyword);
	}

	// 매치 검색(키워드는 HashMap에 저장)
	public List<Match> searchMatchList(HashMap<String, String> keyword) {
		return session.selectList("adminmapper.searchMatchList", keyword);

	}

	// 변경하는 mcode를 가진 매치가 있는지 확인 (모든 조건이 같을 경우 1, 날짜까지 같고 시간이 다를 경우 0, 없을 경우 -1)
	public int mcodeDuplCheck(HashMap params) {
		return session.selectOne("adminmapper.mcodeDuplCheck", params);
	}

	// 매치 날짜 변경 시에 원래 데이터 정보를 새롭게 만든 코드의 데이터로 저장
	public int changeMdate(HashMap map) {
		return session.update("adminmapper.changeMdate", map);
	}

	// 매치 정보를 삭제
	public int deleteMatch(String mcode) {
		return session.delete("adminmapper.deleteMatch", mcode);
	}
	
	// 하나의 매치 정보를 가져온다
	public Match getMatchInfo(String mcode) {
		return session.selectOne("matchmapper.matchInfo", mcode);
	}
	
	// 라인업 수정
	public int updateMatchDetail(Match_detail md) {
		return session.update("adminmapper.updateMatchDetail", md);
	}
	
	// 매치 상태 변경(0 -> 1)
	public int updateMatchStatScore(Match match) {
		return session.update("adminmapper.updateMatchStatScore", match);
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////// 김 동 환
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

	public List<Club> getClubList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("clubmapper.clubList");
	}

	public void insertClub(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.insert("adminmapper.mngInsertClub", mngClub);
	}

	public void insertStadium(Club mngClub) throws Exception {
		// TODO Auto-generated method stub

		session.insert("adminmapper.mngInsertStadium", mngClub);
	}

	public Club getClubCont(String cname) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("adminmapper.mngClubCont", cname);
	}

	public void deleteClub(String cname) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngDeleteClub", cname);
	}

	public Club getClubDetail(String ccode) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("adminmapper.mngClubDetail", ccode);
	}

	public void updateClub(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngUpdateClub", mngClub);
	}

	public void updateStadium(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngUpdateStadium", mngClub);
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

	// 선수 리스트
	public List<Player> plist(Player player) throws Exception {
		return session.selectList("adminmapper.plist", player);
	}

	// 선수 총 인원
	public int getPtotal(Player player) {
		return session.selectOne("adminmapper.getPtotal", player);
	}

	// 선수 기본 정보 선택
	public Player pselect(String pcode) {
		return session.selectOne("adminmapper.pselect", pcode);
	}

	// 선수 상세정보 선택
	public Player_detail pselectd(String pcode) {
		return session.selectOne("adminmapper.pselectd", pcode);
	}

	// 선수 시즌 정보 선택 리스트
	public List<Player_season> pselects(String pcode) {
		return session.selectList("adminmapper.pselects", pcode);
	}

	// 선수 기본정보 입력
	public int pinsert(Player player) {
		return session.insert("adminmapper.pinsert", player);
	}

	// 선수 상세정보 입력
	public int pinsertd(Player_detail playerd) {
		return session.insert("adminmapper.pinsertd", playerd);
	}

	// 선수 정보 입력시 시즌 정보 자동 입력
	public int pinserts(Player_season players) {
		return session.insert("adminmapper.pinserts", players);
	}

	// 선수 기본 정보 업데이트
	public int pupdate(Player player) {
		return session.update("adminmapper.pupdate", player);
	}

	// 선수 상세 정보 업데이트
	public int pupdated(Player_detail playerd) {
		return session.update("adminmapper.pupdated", playerd);
	}

	// 선수 시즌 정보 업데이트
	public int pupdates(Player_season players) {
		return session.update("adminmapper.pupdates", players);
	}

	// 선수 시즌 정보 새로 입력
	public int puinsert(Player_season players) {
		return session.insert("adminmapper.puinsert", players);
	}

	// 선수 정보 삭제
	public int pdelete(String pcode) {
		return session.delete("adminmapper.pdelete",pcode);
	}
	public int pdeleted(String pcode) {
		return session.delete("adminmapper.pdeleted",pcode);
	}
	public int pdeletes(String pcode) {
		return session.delete("adminmapper.pdeletes",pcode);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
