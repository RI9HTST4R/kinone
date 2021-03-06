package com.project.kinone.service;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.kinone.dao.AdminDAOImpl;
import com.project.kinone.dao.MatchDAOImpl;
import com.project.kinone.dao.PlayerDAOImpl;
import com.project.kinone.model.Board;
import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Match;
import com.project.kinone.model.Match_detail;
import com.project.kinone.model.Player;
import com.project.kinone.model.Player_detail;
import com.project.kinone.model.Player_season;
import com.project.kinone.model.Score;
import com.project.kinone.model.Stadium;
import com.project.kinone.util.FileUpload;
import com.project.kinone.util.FileUpload2;
import com.project.kinone.util.Lineup;
import com.project.kinone.util.McodeMaker;
import com.project.kinone.util.StringToTimestamp;

@Service
public class AdminServiceImpl implements AdminServiceInter {

	@Autowired
	private AdminDAOImpl adminDao;

	@Autowired
	private MatchDAOImpl matchDao;

	@Autowired
	private PlayerDAOImpl playerDao;

	////////////////////////////////////////////// 한 동 준
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

	// 시즌 추가
	public int addSeason(String seasoncode) {
		return adminDao.addSeason(seasoncode);
	}
	
	// 시즌 삭제 시 체크하는 메소드
	public boolean checkSeason(String seasoncode) {
		// 이미 등록된 경기가 있으면 삭제 불가
		int count = adminDao.checkSeason(seasoncode);
		if(count > 0) {
			return false;
		}else {
			return true;
		}
	}
	
	// 시즌 삭제
	public int delSeason(String seasoncode) {
		return adminDao.delSeason(seasoncode);
	}
	
	// 등록된 모든 리그
	public List<String> getAllLeague() {
		return adminDao.getAllLeague();
	}

	// 가장 높은 리그
	public String getTopLeague() {
		return adminDao.getTopLeague();
	}

	// 등록된 모든 시즌
	public List<String> getAllSeason() {
		return adminDao.getAllSeason();
	}

	// 가장 최근 시즌
	public String getTopSeason() {
		return adminDao.getTopSeason();
	}

	// 매치 등록 폼 페이지에서 입력한 구단을 체크하는 메소드
	public boolean checkClub(List<String> data) {
		// 넘긴 모든 데이터가 들어있는 list의 크기
		int size = data.size();

		// 들어온 데이터의 값을 중복 값을 제거한 뒤에 넣을 resultList에 저장
		List<String> resultList = new ArrayList<String>();
		for (int i = 0; i < size; i++) {
			if (!resultList.contains(data.get(i))) {
				resultList.add(data.get(i));
			}
		}

		// 중복값이 없는 클럽을 db에서 검색해 본 뒤 그 값과 검색한 list의 크기와 같으면 true, 그렇지 않으면 false를 리턴
		int result = adminDao.checkClub(resultList);
		int listsize = resultList.size();
		System.out.println("원래 list size:" + size + " / 중복제거된 list size:" + listsize + " / 찾아온 결과값:" + result);

		if (listsize == result) {
			return true;
		} else {
			return false;
		}
	}

	// 어드민 페이지에서 매치 정보를 입력
	public int insertMatch(HashMap<String, String> params) throws Exception{

		// 폼에서 넘긴 값을 받아 배열로 나눔
		String lcode = params.get("lcode");
		String mdatelist = params.get("mdatelist");
		String mroundlist = params.get("mroundlist");
		String homelist = params.get("homelist");
		String awaylist = params.get("awaylist");

		String[] mdatearr = mdatelist.trim().split("\n");
		String[] mroundarr = mroundlist.trim().split("\n");
		String[] homearr = homelist.trim().split("\n");
		String[] awayarr = awaylist.trim().split("\n");

		// 배열에서 하나씩 빼면서 매치 객체로 바꿔 리스트에 저장
		List<Match> matchList = new ArrayList<Match>();
		for (int i = 0; i < mdatearr.length; i++) {
			Match match = new Match();

			String time = mdatearr[i].trim();
			// System.out.println("time : "+time);

			String mcode = McodeMaker.convert(lcode, homearr[i], awayarr[i], time);

			match.setLcode(lcode.trim());
			match.setMcode(mcode.trim());

			Timestamp mdate = StringToTimestamp.convert(time);
			// System.out.println("mdate : "+mdate);

			match.setMdate(mdate);
			match.setMround(mroundarr[i].trim());
			match.setCcode_home(homearr[i].trim());
			match.setCcode_away(awayarr[i].trim());

			// System.out.println(match.toString());

			matchList.add(match);
		}
		return adminDao.insertMatch(matchList);
	}
	
	// 등록된 매치 리스트의 총 갯수를 가져오는 메소드
	public int getMatchListCount(HashMap<String, String> keyword) {
		return adminDao.getMatchListCount(keyword);
	}

	// 등록된 매치 리스트 가져오는 메소드
	public List<Match> getMatchList(HashMap<String, String> params) throws Exception{
		List<Match> matchList = adminDao.searchMatchList(params);
		
		return matchList;
	}

	// 매치 날짜 변경 시 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인하는 메소드
	public int mcodeDuplCheck(HashMap params) {
		String cdate = (String) params.get("cdate");
		Timestamp cmdate = StringToTimestamp.convert(cdate);

		String mcode = (String) params.get("mcode");
		String cmcode = McodeMaker.convert(mcode, cdate);

		System.out.println("변경되는 mcode:" + cmcode);
		System.out.println("변경되는 mdate:" + cmdate);

		params.put("cmcode", cmcode);
		params.put("cmdate", cmdate);
		// 1이면 변경 불가, 0이면 변경 가능
		int result = adminDao.mcodeDuplCheck(params);
		return result;
	}

	// 등록된 매치 리스트 페이지에서 매치 날짜를 변경하는 메소드
	public int changeMdate(String mcode, String cdate) {
		HashMap map = new HashMap();

		Timestamp cmdate = StringToTimestamp.convert(cdate);
		map.put("mcode", mcode);
		map.put("mdate", cmdate);

		int result = adminDao.changeMdate(map);

		return result;
	}

	// 등록된 매치 리스트 페이지에서 매치를 삭제하는 메소드
	public int deleteMatch(String[] array) {
		int result = 0;
		for (String mcode : array) {
			result += adminDao.deleteMatch(mcode);
		}
		return result;
	}
	
	// mcode를 통해 하나의 매치 정보를 가져오는 메소드
	public Match getMatchInfo(String mcode) {
		return adminDao.getMatchInfo(mcode);
	}

	// 등록된 매치 리스트 페이지에서 편집 버튼을 통해 라인업 불러오기
	public Lineup getMatchDetail(String mcode) {
		Match_detail md = matchDao.getMatchDetail(mcode);

		return new Lineup(playerDao, md);
	}
	
	// 라인업 수정
	public int updateMatchDetail(Match_detail md) {
		return adminDao.updateMatchDetail(md);
	}
	
	// 매치 상태 수정 및 스코어 수정
	@Transactional
	public int matchEnd(Match match) {
		String mcode = match.getMcode();
		String seasoncode = mcode.substring(6, 10);
		String lcode = mcode.substring(0, 2);
		String ccode_home = "K"+mcode.substring(2,4);
		String ccode_away = "K"+mcode.substring(4,6);
//		System.out.println("ccode_home:"+ccode_home);
//		System.out.println("ccode_away:"+ccode_away);
		
		// 선발로 나간 선수 모두 경기수 + 1
		Match_detail md = matchDao.getMatchDetail(mcode);
		Lineup lu = new Lineup(playerDao, md);
		List<Player> hS = lu.gethStarting();
		List<Player> aS = lu.getaStarting();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 공통정보
		map.put("sort", "count");
		map.put("seasoncode", seasoncode);
		
		// 홈팀
		map.put("ccode", ccode_home);
		for(Player p : hS) {
			String pcode = p.getPcode();
			map.put("pcode", pcode);
			adminDao.updateStat(map);
		}
		System.out.println("홈팀 선수 경기수 증가 완료");
		// 어웨이팀
		map.put("ccode", ccode_away);
		for(Player p : aS) {
			String pcode = p.getPcode();
			map.put("pcode", pcode);
			adminDao.updateStat(map);
		}
		System.out.println("어웨이팀 선수 경기수 증가 완료");
		// 스코어를 통해 득점 실점, 승,무,패의 정보를 시즌 테이블에 기록
		Club_season cs_h = new Club_season();
		Club_season cs_a = new Club_season();
		
		cs_h.setLcode(lcode);
		cs_a.setLcode(lcode);
		
		cs_h.setSeasoncode(seasoncode);
		cs_a.setSeasoncode(seasoncode);
		
		cs_h.setCcode(ccode_home);
		cs_a.setCcode(ccode_away);
		int ggoal = match.getHomescore();
		int lgoal = match.getAwayscore();
		cs_h.setC_ggoal(ggoal);
		cs_h.setC_lgoal(lgoal);
		cs_a.setC_ggoal(lgoal);
		cs_a.setC_lgoal(ggoal);
		
		if(ggoal > lgoal) {
			cs_h.setWin(1);
			cs_a.setLose(1);
		}else if(ggoal == lgoal) {
			cs_h.setDraw(1);
			cs_a.setDraw(1);
		}else {
			cs_h.setLose(1);
			cs_a.setWin(1);
		}
		adminDao.updateSeasonGrade(cs_h);
		adminDao.updateSeasonGrade(cs_a);

		// 매치 상태 변경 0 -> 1, 스코어 입력
		int result = adminDao.updateMatchStatScore(match);
		if(result == 1) System.out.println("매치상태 변경 및 스코어 입력 완료");
		
		return result;
	}
	
	// 득점 및 도움 스탯 올리기
	@Transactional
	public boolean insertScore(Score score) {
		String mcode = score.getMcode();
		String seasoncode = mcode.substring(6, 10);
		String pcode = score.getPcode();
		String ccode = score.getCcode();
		String isas = score.getIsas();
//		System.out.println("mcode:"+mcode);
//		System.out.println("seasoncode:"+seasoncode);
//		System.out.println("pcode:"+pcode);
//		System.out.println("ccode:"+ccode);
		
		// 득점 정보 입력
		Player player = adminDao.pselect(pcode);
		score.setPname(player.getPname());
		if(isas != null) {
			Player asplayer = adminDao.pselect(isas);
			score.setAsname(asplayer.getPname());
		}
		System.out.println(score.toString());
		
		adminDao.insertScore(score);
		System.out.println("스코어 정보 입력 완료");
		
		// 기본적인 조건 정보 입력
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("seasoncode", seasoncode);
		map.put("ccode", ccode);
		
		// 득점한 선수 득점 수 올림
		map.put("pcode", pcode);
		map.put("sort", "g");
		adminDao.updateStat(map);
		System.out.println("득점 선수 득점수 입력완료");
		
		// 도움한 선수 도움 수 올림(도움이 있다면)
		if(isas != null) {
			map.put("pcode", isas);
			map.put("sort", "a");
			adminDao.updateStat(map);
			System.out.println("도움 선수 도움수 입력완료");
		}
		
		// 실점한 골키퍼 실점 수 올림
		String gkcode = score.getGkcode();
		Player gk = adminDao.pselect(gkcode);
		System.out.println("골키퍼:"+gkcode);
		map.put("pcode", gkcode);
		map.put("ccode", gk.getCcode());
		map.put("sort", "l");
		int result = adminDao.updateStat(map);
		System.out.println("골키퍼 실점 늘렸어?"+result);
		System.out.println("실점 선수 실점수 입력완료");
		
		return true;
	}
	
	// 해당 매치에 대한 득점 정보 가져오기
	public List<Score> getMatchScoreInfo(String mcode) {
		return adminDao.getMatchScoreInfo(mcode);
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////// 김 동 환
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

	public List<Club> getMngClubList() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.getClubList();
	}

	public void insertClub(Club mngClub, List<MultipartFile> fileList, String epath) throws Exception {
		// TODO Auto-generated method stub

		// fileList의 0번 인덱스가 emblem 이미지 파일
		MultipartFile efile = fileList.get(0);

		String filePath = FileUpload.fileUpload(efile, epath);

		mngClub.setEmblem(filePath);

		adminDao.insertClub(mngClub);
	}

	public void insertStadium(Stadium st) throws Exception {
		adminDao.insertStadium(st);
	}

	public int deleteClub(HttpServletResponse response, String ccode, String cname, String cmanager) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("delete service");

		Club mclub = adminDao.getClubCont(ccode);
		int result = 0;
		if (!mclub.getCmanager().equals(cmanager)) {
			out.println("<script>");
			out.println("alert('감독이 일치하지 않다!')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();

			return result;

		} else {
			adminDao.deleteClub(ccode);

			result = 1;
		}
		return result;
	}

	public Club getClubDetail(String ccode) throws Exception {
		// TODO Auto-generated method stub
		Club mngClub = adminDao.getClubDetail(ccode);

		return mngClub;
	}

	public void updateClub(Club mngClub, List<MultipartFile> fileList, String epath) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("update service club" + mngClub.getCcode() + ", epath : " + epath);

		MultipartFile efile = fileList.get(0);
		
		System.out.println("updateclub service efile : " + efile);
		String emblem = FileUpload.fileUpload(efile, epath);
		
		// 파일 수정
		if(emblem.split("\\.").length==2) {
			mngClub.setEmblem(emblem);
		
			// 파일 수정 안했을 경우
		}else {
			Club before = getClubDetail(mngClub.getCcode());
			mngClub.setEmblem(before.getEmblem());
		}
		
		System.out.println("emblem : " + emblem);
		System.out.println("mngClub.emeblem : " + mngClub.getEmblem());
		
		adminDao.updateClub(mngClub);
	}

	public void updateStadium(Stadium st) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("update service stadium : " + st.getCcode());
		adminDao.updateStadium(st);
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	public List<Player> plist(Player player) throws Exception {
		return adminDao.plist(player);
	}

	public int getPtotal(Player player) {
		return adminDao.getPtotal(player);
	}

	public Player pselect(String pcode) {
		return adminDao.pselect(pcode);
	}

	public Player_detail pselectd(String pcode) {
		return adminDao.pselectd(pcode);
	}

	public List<Player_season> pselects(String pcode) {
		return adminDao.pselects(pcode);
	}

	public int puinsert(Player_season players) {
		return adminDao.puinsert(players);
	}

	public int pinsert(Player player, MultipartFile file, String path, String pcode) {
		String photo = FileUpload2.fileUpload(file,path,pcode);
		if (photo.split("\\.").length==2) {
			System.out.println("split="+photo.split("\\.").length);
			System.out.println("photosplit="+photo.split("\\."));
			player.setPhoto(photo);
			System.out.println(photo);
		}else{
			System.out.println("split="+photo.split("\\.").length);
			System.out.println("photosplit="+photo.split("\\."));
			photo=null;
		}
		
		player.setPhoto(photo);
		
		return adminDao.pinsert(player);
	}
	
	public String getnewpcode() {
		return adminDao.getnewpcode();
	}

	public int pinsertd(Player_detail playerd) {
		return adminDao.pinsertd(playerd);
	}

	public int pinserts(Player_season players) {
		return adminDao.pinserts(players);
	}

	public int pupdate(Player player,MultipartFile file, String path ) {
		String photo = FileUpload2.fileUpload(file,path,player.getPcode());
		if (photo.split("\\.").length==2) {
			System.out.println("split="+photo.split("\\.").length);
			System.out.println("photosplit="+photo.split("\\."));
			player.setPhoto(photo);
			System.out.println(photo);
		}else{
			System.out.println("photo="+photo);
			System.out.println("split length="+photo.split("\\.").length);
			System.out.println("photosplit="+photo.split("\\."));
			
			Player p = pselect(player.getPcode());
			String prophoto = p.getPhoto();
			player.setPhoto(prophoto);
		}
		
		return adminDao.pupdate(player);
	}

	public int pupdated(Player_detail playerd) {
		return adminDao.pupdated(playerd);
	}

	public int pupdates(Player_season players) {
		return adminDao.pupdates(players);
	}

	public int pdelete(String pcode) {
		return adminDao.pdelete(pcode);
	}
	public int pdeleted(String pcode) {
		return adminDao.pdeleted(pcode);
	}
	public int pdeletes(String pcode) {
		return adminDao.pdeletes(pcode);
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public int board_insert(Board board) {
		// TODO Auto-generated method stub
		return adminDao.board_insert(board);
	}

	public List<Board> getBoardList(int page) {
		// TODO Auto-generated method stub
		return adminDao.getBoardList(page);
	}

	public int getBoardListCount() {
		// TODO Auto-generated method stub
		return adminDao.getBoardListCount();
	}

	public Board getBoard(int bno) {
		// TODO Auto-generated method stub
		return adminDao.getBoard(bno);
	}

	public List<Board> getRecentNews() {
		// TODO Auto-generated method stub
		return adminDao.getRecentNews();
	}

	public int addReadCount(int bno) {
		// TODO Auto-generated method stub
		return adminDao.addReadCount(bno);
	}

	public int delBoard(int bno) {
		// TODO Auto-generated method stub
		return adminDao.delBoard(bno);
	}

	public int board_edit_update(Board board) {
		// TODO Auto-generated method stub
		return adminDao.board_edit_update(board);
	}

	public int club_intro_insert(Map<String, String> map) {
		// TODO Auto-generated method stub
		return adminDao.club_intro_insert(map);
	}

	

	

	

	

}
