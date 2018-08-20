package com.project.kinone.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.MatchDAOImpl;
import com.project.kinone.model.Match;

@Service
public class MatchServiceImpl implements MatchServiceInter {

	@Autowired
	private MatchDAOImpl matchDao;

//////////////////////////////////////////////한 동 준 /////////////////////////////////////////////////////////
	
	// 메인 페이지의 매치 슬라이드에서 노출될 매치 일정일 목록
	@Override
	public List<Date> get7MatchDays(String lcode) {
		Date middleDay = matchDao.getMiddleDay(lcode);

		HashMap map = new HashMap();
		map.put("middleDay", middleDay);
		map.put("lcode", lcode);

		List<Date> matchDays = matchDao.get7MatchDays(map);
		
		return matchDays;
	}

	// 매치 슬라이드의 날짜 목록으로 해당 매치 정보를 가져옴
	@Override
	public HashMap<String, HashMap> getAllMatchInDay(List<Date> matchDays, String lcode) {
		HashMap map = new HashMap(); // 디비에서 사용하기 위한 map
		map.put("lcode", lcode);
		
		HashMap<String, HashMap> matchMapList = new HashMap<String, HashMap>(); // 최종적으로 컨트롤러에 전달할 map
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // date타입의 형식을 string으로 변환하기 위함
		
		for(Date matchDay : matchDays) { // 날짜 마다의 매치를 db에서 찾아 map에 저장하기 위한 for문
			
			// 1) 총 매치 수를 계산하기 위해 해당 날짜를 map에 저장한 후 총 매치 수를 가져와 총 페이지 수를 계산
			map.put("mdate", matchDay);
		//	System.out.println("matchDay : "+matchDay);
			int totalMcount = matchDao.getTotalMcount(map);
			int totalPage = (int)(Math.ceil((double)totalMcount/3));
			
			// 2) 7일의 매치 정보를 3개씩 가져올 때 currentPage는 처음 기준으로 항상 1이고 start는 1, end는 3이다.
		//	int pageNum = Integer.parseInt(currentPage);
			int pageNum = 1;
		//	int start = (pageNum - 1) * 3 + 1;
		//	int end = start + 3 - 1;
			int start = 1;
			int end = 3;
			
			// 3) 해당 날짜의 여러 정보들이 들어갈 map 생성 후 db에서 그 날짜에 해당하는 매치list를 가져온다.
			HashMap inDayMap = new HashMap();
			
			inDayMap.put("currentPage", pageNum);
			inDayMap.put("totalPage", totalPage);
			inDayMap.put("start", start);
			inDayMap.put("end", end);
			String key = sdf.format(matchDay);
		//	System.out.println("key : "+key);
			map.put("day", key);
			map.put("start", start);
			map.put("end", end);
			List<Match> matchListInDay = matchDao.getMatchInDay(map);
			
			inDayMap.put("list", matchListInDay);
			
			// 4) 최종적으로 여러 정보 및 매치list가 담긴 map을 날짜string을 key값으로 하여 matchMapList에 저장
			matchMapList.put(key, inDayMap);
		}
		
		return matchMapList;
	}

	// 월 별 매치가 있는 날짜 리스트를 가져온다.
	public List<Date> getMatchDaysInMonth(String lcode, String seasoncode, String month) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("lcode", lcode);
		map.put("seasoncode", seasoncode);
		map.put("month", month);
		return matchDao.getMatchDaysInMonth(map);
	}

	// 월 별 매치 정보를 가져온다.
	public List<Match> getMatchInMonth(String lcode, String seasoncode, String month) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("lcode", lcode);
		map.put("seasoncode", seasoncode);
		map.put("month", month);
		return matchDao.getMatchInMonth(map);
	}

	public Match get_the_match(String mcode) {
		// TODO Auto-generated method stub
		return matchDao.get_the_match(mcode);
	}

	// 해당 클럽의 이전 경기 결과
	public Match getPrevMatchInfo(String ccode, Timestamp ts) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ccode", ccode);
		map.put("sysdate", ts);
		return matchDao.getPrevMatchInfo(map);
	}

	// 해당 클럽의 다음 경기 일정
	public Match getNextMatchInfo(String ccode, Timestamp ts) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ccode", ccode);
		map.put("sysdate", ts);
		return matchDao.getNextMatchInfo(map);
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

	
}
