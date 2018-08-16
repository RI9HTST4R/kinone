package com.project.kinone.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Match;
import com.project.kinone.model.Member;
import com.project.kinone.model.Player;
import com.project.kinone.model.Reservation;
import com.project.kinone.model.Seats;
import com.project.kinone.model.Stadium;
import com.project.kinone.service.AdminServiceImpl;
import com.project.kinone.service.ClubServiceImpl;
import com.project.kinone.service.MatchServiceImpl;
import com.project.kinone.service.MemberServiceImpl;
import com.project.kinone.service.PlayerServiceImpl;
import com.project.kinone.util.Sha256;

@Controller
public class FrontController {

	@Autowired
	private ClubServiceImpl clubService;

	@Autowired
	private PlayerServiceImpl playerService;

	@Autowired
	private MatchServiceImpl matchService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession ses) {
		List<Club> clubList = clubService.getClubList();
		System.out.println(clubList.toString());
		String seasoncode = adminService.getTopSeason();
		
		String whendata = (String)ses.getAttribute("whendata");
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String d = sdf.format(new Date(System.currentTimeMillis()));
		System.out.println(d);
		if(whendata == null || !sdf.format(new Date(System.currentTimeMillis())).equals(d)) {
			System.out.println("세션 새로 설정");
			// 매치 슬라이드 부분 데이터
			List<Date> k1MatchDays = matchService.get7MatchDays("K1");
			System.out.println("K1 리그 매치 날짜 : " + k1MatchDays);
			HashMap<String, HashMap> k1MatchMapList = matchService.getAllMatchInDay(k1MatchDays, "K1");
			List<Date> k2MatchDays = matchService.get7MatchDays("K2");
			System.out.println("K2 리그 매치 날짜 : " + k2MatchDays);
			HashMap<String, HashMap> k2MatchMapList = matchService.getAllMatchInDay(k2MatchDays, "K2");
			
			ses.setAttribute("whendata", d);
			ses.setAttribute("k1MatchDays", k1MatchDays);
			ses.setAttribute("k1MatchMapList", k1MatchMapList);
			ses.setAttribute("k2MatchDays", k2MatchDays);
			ses.setAttribute("k2MatchMapList", k2MatchMapList);
		}
		
		// 리그 별 클럽 순위 리스트

		List<Club_season> k1ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode,"K1");
		System.out.println("k1 size : "+ k1ClubSeasonRankList.size());
	//	for(Club_season cs : k1ClubSeasonRankList) {
	//		System.out.println("k1:"+cs.toString());
	//	}
		List<Club_season> k2ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode,"K2");
		System.out.println("k2 size : "+ k2ClubSeasonRankList.size());
	//	for(Club_season cs : k2ClubSeasonRankList) {
	//		System.out.println("k2:"+cs.toString());
	//	}

		// 리그 별 선수 순위 리스트
		// 득점랭크
		List<Player> k1PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "g", 2);
		List<Player> k2PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "g", 2);
		// 도움랭크
		List<Player> k1PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "a", 2);
		List<Player> k2PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "a", 2);

		model.addAttribute("clubList", clubList);
		model.addAttribute("k1ClubSeasonRankList", k1ClubSeasonRankList);
		model.addAttribute("k2ClubSeasonRankList", k2ClubSeasonRankList);
		model.addAttribute("k1PlayerSeasonGRankList", k1PlayerSeasonGRankList);
		model.addAttribute("k2PlayerSeasonGRankList", k2PlayerSeasonGRankList);
		model.addAttribute("k1PlayerSeasonARankList", k1PlayerSeasonARankList);
		model.addAttribute("k2PlayerSeasonARankList", k2PlayerSeasonARankList);

		return "main";
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	// 매치 일정 페이지로 이동
	@RequestMapping(value="/matchList.do", method=RequestMethod.GET)
	public String matchList( Model model) {
		
	//	if(seasoncode == null) { // 처음 페이지 로드시에는 가장 최근의 시즌 매치 일정을 가져옴
	//		seasoncode = adminService.getTopSeason();
	//	}
	//	Timestamp sysdate = new Timestamp(System.currentTimeMillis());
	//	System.out.println(sysdate);
	//	SimpleDateFormat sdf = new SimpleDateFormat("MM");
	//	String month = sdf.format(sysdate);
		// 월 별로 매치일과 매치정보 가져옴
	//	List<Date> matchDaysInMonth = matchService.getMatchDaysInMonth(lcode, seasoncode, month);
	//	List<Match> matchInMonth = matchService.getMatchInMonth(lcode, seasoncode, month);
		
		List<String> seasonList = adminService.getAllSeason();
		model.addAttribute("seasonList", seasonList);
		
		return "match_List";
	}
	
	// 매치 데이터 가져오는 메소드
	@RequestMapping(value="/matchListAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, List> matchListAjax(@RequestParam(required=false) String lcode,
								 @RequestParam(required=false) String seasoncode,
								 @RequestParam(required=false) String month) throws Exception {
		System.out.println("lcode:"+lcode);
		System.out.println("seasoncode:"+seasoncode);
		System.out.println("month:"+month);
		if(seasoncode == null) {
			seasoncode = adminService.getTopSeason();
		}
		if(Integer.parseInt(month) < 10) {
			month = "0"+ month;
		}
		
		HashMap<String, List> reqMap = new HashMap<String, List>();
		// 월 별로 매치일과 매치정보 가져옴
		List<Date> matchDaysInMonth = matchService.getMatchDaysInMonth(lcode, seasoncode, month);
		List<Match> matchInMonth = matchService.getMatchInMonth(lcode, seasoncode, month);
		
		reqMap.put("day", matchDaysInMonth);
		reqMap.put("match", matchInMonth);
		
		return reqMap;
	}
	
	// 리그 순위표 및 선수 기록 페이지
	@RequestMapping(value="/rank.do", method=RequestMethod.GET)
	public String rank(Model model) {
		
		List<String> seasonlist = adminService.getAllSeason();
		List<String> leaguelist = adminService.getAllLeague();
		
		String seasoncode = adminService.getTopSeason();
		List<Club_season> clubSeasonRankList = clubService.getClubSeasonRankList(seasoncode,"K1");
		List<Player> playerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "g", 10);
		List<Player> playerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "a", 10);
		
		System.out.println("클럽갯수:" +clubSeasonRankList.size());
		System.out.println("골 선수 명수:" +playerSeasonGRankList.size());
		System.out.println("도움 선수 명수:" +playerSeasonARankList.size());
		
		model.addAttribute("clubSeasonRankList", clubSeasonRankList);
		model.addAttribute("playerSeasonGRankList", playerSeasonGRankList);
		model.addAttribute("playerSeasonARankList", playerSeasonARankList);
		
		model.addAttribute("seasonlist", seasonlist);
		model.addAttribute("leaguelist", leaguelist);
		return "rank";
	}
	
	// 랭킹 데이터 가져오는 메소드
	@RequestMapping(value="/rankListAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, List> rankListAjax(@RequestParam(required=false) String seasoncode,
											  @RequestParam(required=false) String lcode) throws Exception {
		HashMap<String, List> reqMap = new HashMap<String, List>();
		
		System.out.println("seasoncode:"+seasoncode);
		System.out.println("lcode:"+lcode);
		
		List<Club_season> clubSeasonRankList = clubService.getClubSeasonRankList(seasoncode,lcode);
		List<Player> playerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, lcode, "g", 10);
		List<Player> playerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, lcode, "a", 10);
		
		reqMap.put("club", clubSeasonRankList);
		reqMap.put("player_g", playerSeasonGRankList);
		reqMap.put("player_a", playerSeasonARankList);
		return reqMap;
	}
	
	// 예매 페이지
	@RequestMapping(value="/reservation.do", method=RequestMethod.GET)
	public String reservation(Model model) {
		
		List<String> seasonList = adminService.getAllSeason();
		model.addAttribute("seasonList", seasonList);
		
		return "reservation";
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

//////////////////////////////////////////////심 규 진 /////////////////////////////////////////////////////////		
	//로그인 요청
	@RequestMapping(value="/logincall.do")
	public String logincall(@RequestParam String email,@RequestParam String passwd, 
										HttpServletResponse response, HttpSession session, Model model) 
												throws Exception{
		System.out.println("logincall");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();// 출력스트림 객체 생성
		
		if ( session.getAttribute("email") != null ){
            // 기존에 세션 값이 존재한다면
            session.removeAttribute("email"); // 기존값을 제거해 준다.
        }


		 passwd=Sha256.encrypt(passwd);
		
		System.out.println(email+passwd);
		
		
		
		//로긴체크
		Member om = memberService.logincheck(email);
		
		
		if (om==null) {
			
			System.out.println("email does not exist");
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 틀립니다')");
			out.println("history.go(-1)");
			out.println("</script>");
			
		}else {
		
			if (!om.getPasswd().equals(passwd)){
				System.out.println("passwd does not match");
				out.println("<script>");
				out.println("alert('아이디나 비밀번호가 틀립니다')");
				out.println("history.go(-1)");
				out.println("</script>");
			}else if(om.getEmail().equals(email)&&om.getPasswd().equals(passwd)) {
				System.out.println("login sucess");
				out.println("<script>");
				out.println("alert('로그인 성공')");
				out.println("</script>");
				session.setAttribute("email", om.getEmail());
				session.setAttribute("name", om.getMname());
				System.out.println("email="+om.getEmail());
				if(om.getEmail().equals("admin")) {
				System.out.println("admin");
				return"redirect:/admin/main.do";
				
			}else {
				System.out.println("not admin");
				return "redirect:/main.do";
				}
			}
		}
		return null;
	}
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpSession session,Member member) {
		System.out.println("logout");
		
		session.invalidate();
		
		return"main";
	}
	
	//프론트 클럽 리스트
	@RequestMapping("/clubList.do")
	public String clubList(Model model) {

		System.out.println("리그 클럽 목록");
		List<Club> mngClubList = clubService.getClubList();
		System.out.println(mngClubList.toString());
		model.addAttribute("mngClubList", mngClubList);

		return "club_list";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

	/////////////////// 김현준////////////////////

	// 회원 가입 폼으로 이동
	@RequestMapping(value = "/join_form.do")
	public String joinForm() {

		System.out.println("회원 가입");

		return "join";
	}
	// 회원가입 폼 이메일 중복체크 확인 아작스 요청 
	@RequestMapping(value = "/register_email_check.do")
	public String register_email_check(@RequestParam("register_email")String register_email ,Model model) {
		
		System.out.println("입력아이디 잘 나오낭?"+register_email);
		String email = memberService.find_email(register_email);
		System.out.println("확인된 email"+email);
		System.out.println("회원 가입");
		model.addAttribute("ajax", email);
		return "ajax";
	}
	
	
	// 회원 가입 처리
	@RequestMapping(value = "/join_ok.do", method = RequestMethod.POST)
	public String join(Model model, @RequestParam("email") String email,@RequestParam("mname")String mname,@RequestParam("passwd")String passwd, @RequestParam("mbirthdate1")String mbirthdate) {


		System.out.println("회원 가입 DB에 등록"+email+mname+passwd+mbirthdate);
		Member member = new Member();
		member.setEmail(email);
		member.setMname(mname);
		member.setPasswd(passwd);
		// Timestamp 자료형을 위해 변환
		System.out.println(mbirthdate);
		String birthdate = mbirthdate + " 00:00:00";
		System.out.println(birthdate);
		member.setMbirthdate(Timestamp.valueOf(birthdate));
		System.out.println(member.toString());
		
		/*String emailcheck = member.getEmail();
		if(EmailCheck.isValidEmail(emailcheck)) {
			
		}else {
			
		}*/
		System.out.println(member.getEmail());
		int result = memberService.insertJoin(member);
		if(result == 1 )
		System.out.println("DB에 등록 성공");
		model.addAttribute("ajax", result);
		return "ajax";


	}
	@RequestMapping(value = "/register_encrypt.do")
	public String register_encrypt(@RequestParam("register_passwd")String register_passwd ,Model model) {
		
		System.out.println("입력비밀번호 잘 나오낭?"+register_passwd);
		String passwd = Sha256.encrypt(register_passwd);
		System.out.println("암호화된 email"+passwd);
		model.addAttribute("ajax", passwd);
		return "ajax";
	}
	@RequestMapping(value ="/email_send.do")
	public String email_send(@RequestParam("email_number")String email_number,@RequestParam("email")String email1,@RequestParam("name")String name, Model model) {
		
		System.out.println(name+email1+email_number);
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "zun1091@naver.com";
		String hostSMTPpwd = "000000"; // 비밀번호 입력해야함

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "zun1091@naver.com";
		String fromName = name+"씨에게";
		String subject = "K In One 인증메일입니다.";

		// 받는 사람 E-Mail 주소
		String mail = email1;

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p align = 'center'>K in One의 회원가입을 환영합니다.</p><br>" 
							 + "<div align='center'> 인증번호 : " + email_number + "</div>");
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		model.addAttribute("ajax", "good~!!\n 등록된 E-Mail 확인");

		return "ajax";
	}
	
	

	
	// 티켓 예매/////// 
	@RequestMapping(value = "/reserve.do")
	public String reserve(@RequestParam("mcode")String mcode ,Model model,HttpSession session) {
		String email = (String) session.getAttribute("email");
		Member member = memberService.getMember(email);
		List<Reservation> list = clubService.getSeatsList(mcode);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mno", member.getMno());
		map.put("mcode", mcode);
		int bought = clubService.getTickets(map);
		Seats seats;
		List<Seats> list2 = new ArrayList<Seats>();
		for(int i = 0; i<list.size();i++) {
			String seatcode = list.get(i).getSeatcode().substring(list.get(i).getSeatcode().length()-2, list.get(i).getSeatcode().length());
			String seat_type = list.get(i).getSeatcode().substring(list.get(i).getSeatcode().length()-3, list.get(i).getSeatcode().length()-2);
			String seat_num=seatcode;
			if(seatcode.substring(0,1).equals("0")) {
			seat_num = seatcode.replace("0", "");
			}
			seats = new Seats();
			seats.setSeat_num(seat_num);
			seats.setSeat_type(seat_type);
			list2.add(seats);
		}
		
		System.out.println("예약 페이지로 이동 mcode:"+mcode);
		model.addAttribute("mcode", mcode);
		Match match = matchService.get_the_match(mcode);
		System.out.println("mcode"+match.getAwayscore()+match.getCcode_away());
		Club home = clubService.getClub(match.getCcode_home());
		Club away = clubService.getClub(match.getCcode_away());
		
		Stadium sta = clubService.getStadium(home.getCcode());
		model.addAttribute("sold", list2);
		model.addAttribute("sta_name",sta.getSname());
		model.addAttribute("mno",member.getMno());
		model.addAttribute("home",home);
		model.addAttribute("away",away);
		model.addAttribute("m", match);
		model.addAttribute("bought", bought);
		return "reserve";
	}
	
	@RequestMapping(value = "/payment.do")
	public String payment(@RequestParam("stadium")String stadium,@RequestParam("tempa")String tempa) {

		System.out.println("stadium"+stadium);
		System.out.println("tempa"+tempa);
		System.out.println("회원 가입");

		return "payment";
	}
//	@RequestMapping(value = "/payment2.do")
//	public String payment2(Model model, @RequestParam("stadium")String stadium,@RequestParam("tempa")String tempa
//			,@RequestParam("rcode")String rcode,@RequestParam("mcode")String mcode,@RequestParam("ccode")String ccode,@RequestParam("seatcode")String seatcode
//			) {
//		
//		System.out.println("stadium"+stadium);
//		System.out.println("tempa"+tempa);
//		int ajax =1;
//		model.addAttribute("ajax", ajax);
//		return "ajax";
//	}
	
	//pay_complete.do
	@RequestMapping(value = "/pay_complete.do")
	public String pay_complete(HttpSession session, Model model,@RequestParam("rcode")String rcode,@RequestParam("mcode")String mcode,@RequestParam("ccode")String ccode,
			@RequestParam("seatcode")String seatcode) {	
		System.out.println("ccode"+ccode);
		List<Reservation> list = new ArrayList<Reservation>();
		String email = (String) session.getAttribute("email");
		Member member = memberService.getMember(email);
		Reservation resv;
		System.out.println("좌석코드:"+seatcode);
		String real = seatcode.replace("\'","");
		System.out.println("수정된 코드:"+real);
		String[] seatcodes = real.split(",");
		for(int i =0; i<seatcodes.length;i++) {
			String end = seatcodes[i].substring(seatcodes[i].length()-3, seatcodes[i].length());
			resv = new Reservation();
			resv.setCcode(ccode);
			resv.setMcode(mcode);
			resv.setRcode(rcode+end);
			resv.setSeatcode(seatcodes[i]);
			resv.setMno(member.getMno());
			list.add(resv);
			System.out.println("좌석코드:"+seatcodes[i]);
		}
		int checking =0;
		for(int i =0; i<list.size();i++) {
			Reservation re = clubService.checkReserv(list.get(i));
			if(re!=null) {
				checking++;
			}
		}
		System.out.println("하나라도 있는가?"+checking);
		
		if(checking!=0) {
			System.out.println("그 새에 누가 했나벼");
			return "payment_failure";
		}else {
			int result = clubService.insertReserve(list);
			System.out.println("insert잘 되었는가?"+result);
			return "payment_result";
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////
}
