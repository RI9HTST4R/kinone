package com.project.kinone.controller;


import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.kinone.model.Board;
import com.project.kinone.model.Club;
import com.project.kinone.model.Match;
import com.project.kinone.model.Match_detail;
import com.project.kinone.model.Player;
import com.project.kinone.model.Player_detail;
import com.project.kinone.model.Player_season;
import com.project.kinone.model.Score;
import com.project.kinone.model.Stadium;
import com.project.kinone.service.AdminServiceImpl;
import com.project.kinone.service.PlayerServiceImpl;
import com.project.kinone.util.Lineup;
import com.project.kinone.util.PagingPgm;
import com.project.kinone.util.clubname;

@Controller
public class AdminController{
	
	@Autowired
	private AdminServiceImpl adminService;

	
	@Autowired
	private PlayerServiceImpl playerService;
	
////////////////////////////////////////////// 한 동 준 /////////////////////////////////////////////////////////

	// 어드민 메인페이지
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest req) throws Exception{
		String seasoncode = adminService.getTopSeason();
		List<String> seasonlist = adminService.getAllSeason();
		Date sysdate = new Date();
		model.addAttribute("seasoncode", seasoncode);
		model.addAttribute("seasonlist", seasonlist);
		model.addAttribute("sysdate", sysdate);
		return "admin/main";
	}
	
	// 시즌 추가 메소드
	@RequestMapping(value="/admin/addSeason.do", method=RequestMethod.POST)
	public String addSeason(@RequestParam String seasoncode, Model model) throws Exception{
	//	System.out.println("season : "+ seasoncode);
		int result = adminService.addSeason(seasoncode);
		
		if(result == 1) {
			model.addAttribute("msg", "등록되었습니다.");
		}else {
			model.addAttribute("msg", "등록 실패");
		}
		model.addAttribute("loc", "/kinone/admin/main.do");
		return "msg";
	}
	
	// 시즌 삭제 시 체크하는 메소드
	@RequestMapping(value="/admin/checkSeason.do", method=RequestMethod.POST)
	public String checkSeason(@RequestParam String seasoncode, Model model) throws Exception{
	//	System.out.println("season : "+ seasoncode);
		boolean bool = adminService.checkSeason(seasoncode);
		
		if(bool) {
			// 삭제 가능
			model.addAttribute("ajax", "1");
		}else {
			// 삭제 불가능
			model.addAttribute("ajax", "0");
		}
		
		return "ajax";
	}
	
	// 시즌 삭제
	@RequestMapping(value="/admin/delSeason.do", method=RequestMethod.POST)
	public String delSeason(@RequestParam String seasoncode, Model model) throws Exception{
	//	System.out.println("season : "+ seasoncode);
		int result = adminService.delSeason(seasoncode);
		
		model.addAttribute("ajax", result);
		
		return "ajax";
	}

	// 어드민 매치 등록 폼 페이지
	@RequestMapping(value = "/admin/matchForm.do", method = RequestMethod.GET)
	public String matchForm() throws Exception{
		return "admin/match_Form";
	}

	// 매치 등록 폼 페이지에서 입력한 구단을 체크하는 메소드
	@RequestMapping(value = "/admin/checkClub.do", method = { RequestMethod.POST })
	public String checkClub(@RequestParam List<String> data, Model model) throws Exception{
		System.out.println(data);
		boolean bool = adminService.checkClub(data);

		model.addAttribute("ajax", bool);

		return "ajax";
	}

	// 매치 등록 폼 페이지에서 데이터 db에 입력하는 메소드

	@RequestMapping(value="/admin/insertMatch.do", method=RequestMethod.POST)
	public String insertMatch(@RequestParam HashMap<String, String> params, Model model) throws Exception {
		
		int result = adminService.insertMatch(params); 
		
		String msg = result + "건의 데이터가 입력되었습니다.";
		String loc = "/kinone/admin/matchList.do";

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "msg";
	}

	// 등록된 매치 리스트 페이지

	@RequestMapping(value="/admin/matchList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String matchList(@RequestParam HashMap<String, String> params, Model model) throws Exception {

		List<String> seasonList = adminService.getAllSeason();
		List<String> leagueList = adminService.getAllLeague();

		// 처음 혹은 검색된 매치 리스트의 총 갯수
		int total = adminService.getMatchListCount(params);
	//	System.out.println("total : "+total);
		
		int rowPerPage = 30;
		String pageNum = params.get("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
	//	System.out.println(pp.toString());
		params.put("startRow", ""+pp.getStartRow());
		params.put("endRow", ""+pp.getEndRow());
		
		List<Match> matchList = adminService.getMatchList(params);

		model.addAttribute("leagueList", leagueList);
		model.addAttribute("seasonList", seasonList);
		model.addAttribute("matchList", matchList);
		model.addAttribute("condition", params);
		model.addAttribute("pp", pp);
		return "admin/match_List";
	}

	// 매치 리스트 페이지에서 매치 날짜 변경 시 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인
	@RequestMapping(value = "/admin/mcodeDuplCheck.do", method = RequestMethod.POST)
	public String mcodeDuplCheck(@RequestParam HashMap params, Model model) throws Exception{
		// 모든 조건이 같을 경우 1, 날짜까지 같고 시간이 다를 경우 0, 없을 경우 -1 리턴
		int result = adminService.mcodeDuplCheck(params);
		model.addAttribute("ajax", result);
		return "ajax";
	}

	// 등록된 매치 리스트 페이지에서 매치 날짜 변경 메소드
	@RequestMapping(value = "/admin/changeMdate.do", method = RequestMethod.POST)
	public String changeMdate(@RequestParam String mcode, @RequestParam String cdate, Model model) throws Exception{
		System.out.println("mcode:" + mcode); // 변경하고자 하는 매치 코드
		System.out.println("mdate:" + cdate); // 변경 될 날짜

		int result = adminService.changeMdate(mcode, cdate);

		model.addAttribute("ajax", result);
		return "ajax";
	}

	// 등록된 매치 리스트 페이지에서 매치 삭제
	@RequestMapping(value = "/admin/deleteMatch.do", method = RequestMethod.POST)
	public String deleteMatch(@RequestParam String[] array, Model model) throws Exception{
		int total = array.length;
		int result = adminService.deleteMatch(array);
		String succrate = result + "/" + total;
		model.addAttribute("ajax", succrate);
		return "ajax";
	}
	
	// 매치의 라인업과 상태, 스코어를 편집할 수 있는 페이지로 이동
	@RequestMapping(value="/admin/matchDetailForm.do", method=RequestMethod.POST)
	public String matchDetailForm(@RequestParam String mcode, Model model) throws Exception{
		System.out.println("mcode:"+mcode);
		
		// 해당 매치의 정보
		Match match = adminService.getMatchInfo(mcode);
		System.out.println(match.toString());
		// 해당 매치의 클럽 소속 선수들
		String ccode_home = match.getCcode_home();
		String ccode_away = match.getCcode_away();
		System.out.println("ccode_home:"+ccode_home+" ccode_away:"+ccode_away);
		List<Player> pList_home = playerService.getPlayerListInClub(ccode_home);
		List<Player> pList_away = playerService.getPlayerListInClub(ccode_away);
		
		// 라인업이 등록되었다면 그 등록된 라인업 선수 정보
		Lineup lu = adminService.getMatchDetail(mcode);
		
		// 종료된 매치는 득점 정보도 같이 불러온다.
		int mstatus = match.getMstatus();
		if(mstatus == 1) {
			List<Score> scoreInfo = adminService.getMatchScoreInfo(mcode);
			model.addAttribute("scoreInfo", scoreInfo);
		}
		
		model.addAttribute("match", match);
		model.addAttribute("pList_home", pList_home);
		model.addAttribute("pList_away", pList_away);
		model.addAttribute("lu", lu);
		return "admin/match_detail";
}
	// 라인업 수정
	@RequestMapping(value="/admin/updateMatchDetail.do", method=RequestMethod.POST)
	public String updateMatchDetail(Match_detail md, Model model) throws Exception{
		System.out.println("mcode : "+md.getMcode());
		System.out.println("hLineup : "+md.getHomelineup());
		System.out.println("aLineup : "+md.getAwaylineup());
		
		int result = adminService.updateMatchDetail(md);
		System.out.println("result:"+result);
		model.addAttribute("ajax", result);
		return "ajax";
	}
	
	// 매치 종료 상태로 업데이트 및 스코어 입력
	@RequestMapping(value="/admin/matchEnd.do", method=RequestMethod.POST)
	public String matchEnd(Match match, Model model) throws Exception{
		System.out.println(match.toString());
		System.out.println("mcode : "+match.getMcode());
		System.out.println("homescore : "+match.getHomescore());
		System.out.println("awayscore : "+match.getAwayscore());
		
		int result = adminService.matchEnd(match);
		
		model.addAttribute("ajax", result);
		
		return "ajax";
	}
	
	// 매치 종료 상태로 득점 및 도움, 실점 스탯 올리기
	@RequestMapping(value="/admin/scoreInsert.do", method=RequestMethod.POST)
	public String scoreInsert(Score score, Model model) throws Exception{
		
	//	System.out.println(score.toString());
		
		boolean result = adminService.insertScore(score);
		
		model.addAttribute("ajax", result);
		return "ajax";
	}

	// 게시판 리스트 페이지
	@RequestMapping(value="/admin/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model, String page) throws Exception{
		
		
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		List<Board> list = adminService.getBoardList(Integer.parseInt(page));
		int listcount = adminService.getBoardListCount();
		int limit = 10;
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		int startpage = (((int) ( Double.parseDouble(page) / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("list", list);
		model.addAttribute("listcount", listcount);
		
		
		
		
		return "admin/board_List";
	}
	
	// 게시판 글 작성 페이지
	@RequestMapping(value="/admin/boardwrite.do", method=RequestMethod.GET)
	public String boardwrite() throws Exception{
		return "admin/board_write";
	}
	// 세부 목록 페이지 
	@RequestMapping(value="/admin/board_cont.do", method=RequestMethod.GET)
	public String board_cont(@RequestParam("bno") String bno,Model model,String page) throws Exception{
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		Board bcont = adminService.getBoard(Integer.parseInt(bno));
		
		model.addAttribute("bcont", bcont);
		model.addAttribute("page", page);
		
		
		
		return "admin/board_cont";
	}
	
		@RequestMapping(value="/admin/boardList_edit.do", method=RequestMethod.GET)
	public String boardList_edit(@RequestParam("bno") String bno,Model model,String page) {
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		Board bcont = adminService.getBoard(Integer.parseInt(bno));
		
		model.addAttribute("bcont", bcont);
		model.addAttribute("page", page);
		
		
		
		return "admin/board_cont_edit";
	}
		//board_edit_update
		
		@RequestMapping(value="/admin/board_edit_update.do", method=RequestMethod.POST)
		public String board_edit_update(@RequestParam("bno") String bno,@RequestParam("image1") MultipartFile mf, Model model, HttpServletRequest request,HttpSession session,Board board,String page) throws Exception {
			if(page == null || page.equals("")) {
				page = "1";
			}
			board.setBno(Integer.parseInt(bno));
			Board bcont = adminService.getBoard(Integer.parseInt(bno));
			String filename;
			if(mf.isEmpty()) {
				board.setImage(bcont.getImage());
			}else {
				filename = mf.getOriginalFilename();
				int size = (int) mf.getSize();
				
				
				String path = request.getRealPath("/resources/board_upload");
				System.out.println(mf);
				System.out.println(filename);
				System.out.println(path);
				System.out.println(size);
				int result= 0; 
				String file[] = filename.split("\\.");
				System.out.println(file[1]);
				if(size>10000000) {
					result= 1; 
					model.addAttribute("ajax",result);
					return "ajax"; 
				}
				if(size>0) {
					mf.transferTo(new File(path+"/"+filename));
				}
				
				board.setImage(filename);
			}
			
			int result = adminService.board_edit_update(board);

			model.addAttribute("result", result);
			model.addAttribute("page", page);
			
			
			
			return "admin/board_edit_update";
		}
		
		@RequestMapping(value="/admin/boardList_del.do", method=RequestMethod.GET)
	public String boardList_del(@RequestParam("bno") String bno,Model model,String page) {
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		int result = adminService.delBoard(Integer.parseInt(bno));
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		
		return "admin/boardList_del";
	}
	
	// 게시판 글 작성 insert
	@RequestMapping(value="/admin/board_insert.do", method=RequestMethod.POST)
	public String board_insert(@RequestParam("image1") MultipartFile mf, Model model, HttpServletRequest request,HttpSession session,Board board) throws Exception {
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		
		
		String path = request.getRealPath("/resources/board_upload");
		System.out.println(mf);
		System.out.println(filename);
		System.out.println(path);
		System.out.println(size);
		int result= 0; 
		String file[] = filename.split("\\.");
		System.out.println(file[1]);
		if(size>10000000) {
			result= 1; 
			model.addAttribute("ajax",result);
			return "ajax"; 
		}
		
		if(size>0) {
			mf.transferTo(new File(path+"/"+filename));
		}
		
		board.setImage(filename);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		board.setRegidate(ts);
		int result2 = adminService.board_insert(board);
		System.out.println("board_insert 결과:"+result2);
		
		return "redirect:/admin/boardList.do";
	}
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////// 김 동 환 /////////////////////////////////////////////////////////

	// 리그 클럽 목록
	@RequestMapping("/admin/club_view.do")
	public String clubView(Model model) throws Exception {

		System.out.println("리그 클럽 목록");
		List<Club> mngClubList = adminService.getMngClubList();
		System.out.println(mngClubList.toString());
		model.addAttribute("mngClubList", mngClubList);

		return "admin/club_view";
	}

	// 클럽 생성 페이지
	@RequestMapping("/admin/create_club.do")
	public String createClubView() {

		System.out.println("클럽 생성 페이지");

		return "admin/club_create";
	}
	//clubIntro입력하기
	@RequestMapping("/admin/clubIntro.do")
	public String clubIntro(Model model) throws Exception {
		List<Club> clubs = adminService.getMngClubList();
		
		model.addAttribute("clubs", clubs);
		System.out.println("클럽 소개 생성");

		return "admin/club_intro_write";
	}
	
	//클럽 소개 정보 입력
	@RequestMapping(value="/admin/club_intro_insert.do", method=RequestMethod.POST)
	public String club_intro_insert(@RequestParam("ccode") String ccode, @RequestParam("content") String content, Model model,HttpSession session) throws Exception {
		
		System.out.println("ccode:"+ccode);
		System.out.println("content:"+content);
		Map<String,String> map = new HashMap<String,String>();
		map.put("ccode",ccode);
		map.put("intro",content);
		
		
		int result = adminService.club_intro_insert(map);
		System.out.println("club_intro_insert 결과:"+result);
		model.addAttribute("result", result);
		
		return "/admin/club_intro_insert_result";
	}
	

	// 클럽 생성 페이지에서 클럽 생성
	@RequestMapping(value = "/admin/create_club_ok.do", method = RequestMethod.POST)
	public String createClub(Club mngclub, MultipartHttpServletRequest mtfRequest) throws Exception {

		System.out.println("클럽 생성 서비스");

		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String epath = mtfRequest.getSession().getServletContext().getRealPath("resources/emblem");
		Stadium st = new Stadium();
		st.setSname(mngclub.getSname());
		st.setCapacity(mngclub.getCapacity());
		st.setLat(mngclub.getLat());
		st.setLon(mngclub.getLon());
		adminService.insertClub(mngclub, fileList, epath);
		adminService.insertStadium(st);

		return "redirect:/admin/club_view.do";
	}

	// 클럽 삭제 페이지
	@RequestMapping("/admin/delete_club.do")
	public String deleteClubView(@RequestParam String ccode, Model model) throws Exception{

		System.out.println("클럽 삭제 페이지");
		model.addAttribute("ccode", ccode);
		return "admin/club_delete";

	}

	// 클럽 삭제 페이지에서 클럽 삭제
	@RequestMapping("/admin/delete_club_ok.do")
	public String deleteClub(String ccode, String cname, String cmanager, HttpServletResponse response) throws Exception {

		System.out.println("클럽 삭제");

		adminService.deleteClub(response, ccode, cname, cmanager);
//		mngServ.deleteStadium(ccode,);	//경기장 삭제

		return "redirect:/admin/club_view.do";
	}

	// 클럽정보 상세보기 페이지
	@RequestMapping("/admin/detail_club.do")
	public ModelAndView detailView(String ccode, HttpServletResponse response) throws Exception {

		System.out.println("클럽 상세 정보 페이지");
		
		// 상세정보 가져오기
		Club mngC = adminService.getClubDetail(ccode);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("mngC", mngC);
		mv.setViewName("admin/club_detail");

		return mv;
	}

	// 클럽 수정 페이지
	@RequestMapping("/admin/update_club.do")
	public ModelAndView updateclubView(String ccode) throws Exception {

		System.out.println("클럽 수정 페이지");
		
		Club mngC = adminService.getClubDetail(ccode);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mngC", mngC);
		mv.setViewName("admin/club_update");

		return mv;
	}

	// 클럽 수정 페이지에서 클럽 수정
	@RequestMapping(value="/admin/update_club_ok.do", method = RequestMethod.POST)
	public String updateClub(Club mngClub, MultipartHttpServletRequest mtfRequest) throws Exception {

		System.out.println("클럽 수정");

		List<MultipartFile> fileList = mtfRequest.getFiles("file");
	
		String epath = mtfRequest.getSession().getServletContext().getRealPath("resources/emblem");
		Stadium st = new Stadium();
		st.setCcode(mngClub.getCcode());
		st.setSname(mngClub.getSname());
		st.setCapacity(mngClub.getCapacity());
		st.setLat(mngClub.getLat());
		st.setLon(mngClub.getLon());

		adminService.updateClub(mngClub, fileList, epath);
		adminService.updateStadium(st);

		return "redirect:/admin/club_view.do";

	}
	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

//////////////////////////////////////////////심 규 진 /////////////////////////////////////////////////////////	

	// 선수 리스트 출력 페이지 이동
	@RequestMapping("/admin/plist.do")
	public String plist(String pageNum, Player player, Model model) throws Exception {

		System.out.println("plist");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		final int rowPerPage = 10;

		int currentPage = Integer.parseInt(pageNum);

		
		int total= adminService.getPtotal(player);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		player.setStartRow(startRow);
		player.setEndRow(endRow);
		List<Player> list=adminService.plist(player);
		List<Club> clist=adminService.getMngClubList();
		
		HashMap<String,String> cn = clubname.insertcname(clist);
		
		model.addAttribute("list",list);
		model.addAttribute("no",pp.getNo());
		model.addAttribute("pp",pp);
		model.addAttribute("cn",cn);
		
		
		//검색
		model.addAttribute("teamcode",player.getTeamcode());
		model.addAttribute("sposition",player.getSposition());
		model.addAttribute("keyword",player.getKeyword());
		
		return "admin/player_list";
	}

	// 선수 상세정보 페이지 이동
	@RequestMapping("/admin/pview.do")
	public String pview(String pcode, Model model) throws Exception {
		System.out.println("pview");

		Player player = adminService.pselect(pcode);
		Player_detail playerd = adminService.pselectd(pcode);
		List<Player_season> players = adminService.pselects(pcode);
		List<Club> clist=adminService.getMngClubList();
		
		HashMap<String,String> cn = clubname.insertcname(clist);
		model.addAttribute("cn", cn);
		model.addAttribute("player", player);
		model.addAttribute("playerd", playerd);
		model.addAttribute("players", players);

		return "admin/player_info";
	}

	// 선수 입력 페이지 이동
	@RequestMapping("/admin/pinsertForm1.do")
	public String pinsertForm(Model model) throws Exception {
		System.out.println("insertForm1");
		List<Club> clist=adminService.getMngClubList();
		
		HashMap<String,String> cn = clubname.insertcname(clist);
		model.addAttribute("cn", cn);
		return "admin/player_Form";
	}

	// 선수 입력
	@RequestMapping("/admin/pinsert1.do")
	public String pinsert1(Player player, 
						Player_detail playerd, 
						Player_season players, 
						MultipartHttpServletRequest mhsr,
						HttpServletResponse response,
						@RequestParam("birthdate1") String birthdate1,
						Model model) throws Exception{
		System.out.println("pinsert");
		//date 를 timestamp로 형변환

		System.out.println(birthdate1);
		String birthdate2 = birthdate1 + " 00:00:00";
		System.out.println(birthdate2);
		playerd.setBirthdate(Timestamp.valueOf(birthdate2));
		System.out.println(player.toString());

		
		//file upload처리
		MultipartFile file = mhsr.getFile("file");
		
		String path = mhsr.getSession().getServletContext().getRealPath("/resources/player/"+player.getCcode());
		//업로드 파일명을 위한 새 pcode 꺼내오기
		String pcode;
		if ((int)(Math.log10(Integer.parseInt(adminService.getnewpcode().substring(1))+1)+1)>3) {
			pcode = "P"+(Integer.parseInt(adminService.getnewpcode().substring(1))+1);
		}else {
			pcode = "P0"+(Integer.parseInt(adminService.getnewpcode().substring(1))+1);
		}
		System.out.println("꺼내온 pcode="+adminService.getnewpcode());
		System.out.println("새로 입력하는 pcode="+pcode);
		//service호출해서 업로드
		int result1 = adminService.pinsert(player, file, path, pcode);
		System.out.println("insert1="+result1);

		int result2 = adminService.pinsertd(playerd);
		
		System.out.println("insert2=" + result2);
		int result3 = adminService.pinserts(players);

		System.out.println("insert3="+result3);
		
		//리다이렉트를 위한 pcode->pcode 사용
				
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result1==1 && result2==1) {
			model.addAttribute("pcode",pcode);
			
			return "redirect:/admin/pview.do";
		}
		else {
			out.println("<script>");
			out.println("alert('입력에 실패했습니다')");
			out.println("</script>");
			out.close();

		return "admin/player_list";
		}
		
	}

	// 선수 기본+상세정보 수정 페이지 이동
	@RequestMapping("/admin/pupdateForm1.do")
	public String pupdateForm1(String pcode, Model model) throws Exception {
		Player player = adminService.pselect(pcode);
		Player_detail playerd = adminService.pselectd(pcode);
		List<Club> clist=adminService.getMngClubList();
		HashMap<String,String> cn = clubname.insertcname(clist);
		
		model.addAttribute("cn", cn);
		model.addAttribute("player", player);
		model.addAttribute("playerd", playerd);
		return "admin/player_detail_update";
	}

	// 선수 시즌 수정 페이지 이동
	@RequestMapping("/admin/pupdateForm2.do")
	public String pupdateForm2(String pcode, Model model) throws Exception {
		Player player = adminService.pselect(pcode);
		Player_detail playerd = adminService.pselectd(pcode);
		List<Player_season> players = adminService.pselects(pcode);
		List<Club> clist=adminService.getMngClubList();
		HashMap<String,String> cn = clubname.insertcname(clist);
		
		model.addAttribute("cn", cn);
		model.addAttribute("player", player);
		model.addAttribute("playerd", playerd);
		model.addAttribute("players", players);
		model.addAttribute("pcode", pcode);
		return "admin/player_season_update";
	}

	// 선수 시즌 추가 페이지 이동
	@RequestMapping("/admin/pupdateForm3.do")
	public String pupdate(String pcode, Model model) throws Exception {
		Player player = adminService.pselect(pcode);
		Player_detail playerd = adminService.pselectd(pcode);
		List<Player_season> players = adminService.pselects(pcode);
		List<Club> clist=adminService.getMngClubList();
		HashMap<String,String> cn = clubname.insertcname(clist);
		
		model.addAttribute("cn", cn);
		model.addAttribute("player", player);
		model.addAttribute("playerd", playerd);
		model.addAttribute("players", players);
		model.addAttribute("pcode", pcode);

		return "admin/player_season_insert";
	}

	// 선수 기본+상세정보 수정
	@RequestMapping("/admin/pupdate1.do")

	public String pupdate1(String pcode, 
									Player player, 
									Player_detail playerd, 
									MultipartHttpServletRequest mhsr,
									HttpServletResponse response,
									@RequestParam("birthdate1") String birthdate1,
									Model model) throws Exception{
		System.out.println("pupdate1");
		
		//date->timestamp변환
		System.out.println("birthdate1=" +birthdate1);
		String birthdate2=birthdate1+" 00:00:00";
		System.out.println("birthdate2="+birthdate2);
		playerd.setBirthdate(Timestamp.valueOf(birthdate2));

		
		//file upload처리
		MultipartFile file=mhsr.getFile("file");
		String path= mhsr.getSession().getServletContext().getRealPath("resources/player/"+player.getCcode());
		System.out.println("path="+path);
		
		
		//player,playerd에 값 있나 확인하고 인서트 처리
		System.out.println("player pname="+player.getPname());
		System.out.println("playerd nation="+playerd.getNation());
		int result1 = adminService.pupdate(player,file,path);
		int result2 = adminService.pupdated(playerd);

		System.out.println("result1="+result1);
		System.out.println("result2="+result2);
		
		model.addAttribute("pcode",player.getPcode());
		
		//alert띄우려고 getwriter 호출
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//결과에 따라 리다이렉트
		if(result1==1 && result2==1) {
			return "redirect:/admin/pview.do";
		}
		else {
			out.println("<script>");
			out.println("alert('수정에 실패했습니다')");
			out.println("</script>");
			out.close();
		return "redirect:/admin/pview.do";
		}
	}

	// 선수 시즌 정보 수정
	@RequestMapping("/admin/pupdate2.do")
	public String pupdate2(String pcode, 
			Player_season players,
			HttpServletResponse response,
			Model model) throws Exception{
			
			//받은 시즌 정보 수정
			System.out.println("pupdate2");
			System.out.println(players.toString());
		
			int result=adminService.pupdates(players);
			System.out.println("pupdate2 result = "+result);
			
			//alert띄우려고 getwriter 호출
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			//리다이렉트용 pcode
			model.addAttribute("pcode",players.getPcode());
			
			//결과에 따라 alert호출
			if(result==1) {
				return "redirect:/admin/pupdateForm2.do";
			}
			else {
				out.println("<script>");
				out.println("alert('수정에 실패했습니다')");
				out.println("</script>");
				out.close();
			return "redirect:/admin/pupdateForm2.do";
			}
	}

	// 선수 시즌 정보 추가
	@RequestMapping("/admin/pupdate3.do")
	public String pupdate3(String pcode, 
			Player_season players,
			HttpServletResponse response,
			Model model) throws Exception{
			
			//players 정보 확인하고 정보추가
			System.out.println("pupdate3");
			System.out.println("players ="+players.getCcode()+players.getPcode());
			int result = adminService.puinsert(players);
			System.out.println("pupdate3 result = "+result);
			
			
			//alert띄우려고 getwriter 호출
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			
			model.addAttribute("pcode",players.getPcode());
			if(result==1) {
				
				return "redirect:/admin/pupdateForm2.do";
			}
			else {
				out.println("<script>");
				out.println("alert('수정에 실패했습니다')");
				out.println("</script>");
				out.close();

			return "redirect:/admin/pupdateForm2.do";
			}
	}
	
	//선수 삭제
	@RequestMapping("/admin/pdelete.do")
	public String pdelete(String pcode, 
			HttpServletResponse response,
			Model model) throws Exception{
		System.out.println("pdelete");
		int result3 = adminService.pdeleted(pcode);
		int result2 = adminService.pdeletes(pcode);
		int result1 = adminService.pdelete(pcode);
		
		
		
	
		
		//alert띄우려고 getwriter 호출
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result1==1&&result2==1&&result3==1) {
			
			return "redirect:/admin/plist.do";
		}
		else {
			model.addAttribute("pcode",pcode);
			out.println("<script>");
			out.println("alert('삭제에 실패했습니다')");
			out.println("</script>");
			out.close();

		return "redirect:/admin/pview.do";
		}
		
	}
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

}
