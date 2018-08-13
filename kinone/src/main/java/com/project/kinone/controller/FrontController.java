package com.project.kinone.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Match;
import com.project.kinone.model.Member;
import com.project.kinone.model.Player;
import com.project.kinone.service.AdminServiceImpl;
import com.project.kinone.service.ClubServiceImpl;
import com.project.kinone.service.MatchServiceImpl;
import com.project.kinone.service.MemberServiceImpl;
import com.project.kinone.service.PlayerServiceImpl;
import com.project.kinone.util.EmailCheck;
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
		List<Club_season> k1ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode, "K1");
		List<Club_season> k2ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode, "K2");

		// 리그 별 선수 순위 리스트
		// 득점랭크
		List<Player> k1PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "g");
		List<Player> k2PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "g");
		// 도움랭크
		List<Player> k1PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "a");
		List<Player> k2PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "a");

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
            // 기존에 login이란 세션 값이 존재한다면
            session.removeAttribute("email"); // 기존값을 제거해 준다.
        }


//		String pass=Sha256.encrypt(member.getPasswd());
		
		System.out.println(email+passwd);
		
		
		
		//로긴체크
		Member om = memberService.logincheck(email);
		
		
		if (om.getEmail()==null) {
			
			System.out.println("email does not exist");
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 틀립니다')");
			out.println("history.back()");
			out.println("</script>");
			
			return "login";
		}else if (!om.getPasswd().equals(passwd)){
			System.out.println("passwd does not match");
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 틀립니다')");
			out.println("history.back()");
			out.println("</script>");
			return "login";
		}else if(om.getEmail().equals(email)&&om.getPasswd().equals(passwd)) {
			System.out.println("login sucess");
			out.println("<script>");
			out.println("alert('로그인 성공')");
			out.println("history.back()");
			out.println("</script>");
			session.setAttribute("email", om.getEmail());
			model.addAttribute("mname",om.getMname());
			System.out.println("email="+om.getEmail());
			if(om.getEmail().equals("admin")) {
				System.out.println("admin");
				return"/admin/main";
			}else {
				System.out.println("not admin");
			return "main";
			}
		}else {
			System.out.println("unknown error");
			return "null";
		}
		
	}
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpSession session,Member member) {
		System.out.println("logout");
		
		session.invalidate();
		
		return"main";
	}
	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

	/////////////////// 김동환////////////////////

	// 회원 가입 폼으로 이동
	@RequestMapping(value = "/join_form.do")
	public String joinForm() {

		System.out.println("회원 가입");

		return "join";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/join_ok.do", method = RequestMethod.POST)
	public String join(Member member, @RequestParam("mbirthdate1")String mbirthdate) {

		System.out.println("회원 가입 DB에 등록");
		
		// Timestamp 자료형을 위해 변환
		System.out.println(mbirthdate);
		String birthdate = mbirthdate + " 00:00:00";
		System.out.println(birthdate);
		member.setMbirthdate(Timestamp.valueOf(birthdate));
		System.out.println(member.toString());
		
		String emailcheck = member.getEmail();
		if(EmailCheck.isValidEmail(emailcheck)) {
			
		}else {
			
		}
		
		int result = memberService.insertJoin(member);
		if(result == 1 )
		System.out.println("DB에 등록 성공");
		
		return "redirect:/admin/club_view.do";

	}

	////////////////////////////////////////////
}
