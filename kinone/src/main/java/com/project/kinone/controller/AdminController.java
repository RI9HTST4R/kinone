package com.project.kinone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.kinone.model.Club;
import com.project.kinone.model.Match;
import com.project.kinone.model.Player;
import com.project.kinone.service.AdminServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminService;	
	
////////////////////////////////////////////// 한 동 준 /////////////////////////////////////////////////////////
	
	// 어드민 메인페이지
	@RequestMapping(value="/admin/main.do", method=RequestMethod.GET)
	public String main(Model model) {
		String seasoncode = adminService.getTopSeason();
		model.addAttribute("seasoncode", seasoncode);
		return "admin/main";
	}
	
	// 어드민 매치 등록 폼 페이지
	@RequestMapping(value="/admin/matchForm.do", method=RequestMethod.GET)
	public String matchForm() {
		return "admin/match_Form";
	}
	
	// 매치 등록 폼 페이지에서 입력한 구단을 체크하는 메소드
	@RequestMapping(value="/admin/checkClub.do", method= {RequestMethod.POST})
	public String checkClub(@RequestParam List<String> data, Model model) {
		System.out.println(data);
		boolean bool = adminService.checkClub(data);
		
		model.addAttribute("ajax",bool);
	
		return "ajax";
	}
	
	// 매치 등록 폼 페이지에서 데이터 db에 입력하는 메소드
	@RequestMapping(value="/admin/insertMatch.do", method=RequestMethod.POST)
	public String insertMatch(@RequestParam HashMap<String, String> params, Model model) {
		
		int result = adminService.insertMatch(params); 
		
		String msg = result + "건의 데이터가 입력되었습니다.";
		String loc = "/kinone/admin/matchList.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "msg";
	}
	
	// 등록된 매치 리스트 페이지
	@RequestMapping(value="/admin/matchList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String matchList(@RequestParam HashMap<String, String> params, Model model) {
		List<String> seasonList = adminService.getAllSeason();
		List<String> leagueList = adminService.getAllLeague();

		List<Match> matchList = adminService.getMatchList(params);
		
		model.addAttribute("leagueList", leagueList);
		model.addAttribute("seasonList", seasonList);
		model.addAttribute("matchList", matchList);
		model.addAttribute("condition", params);
		return "admin/match_List";
	}
	
	// 매치 리스트 페이지에서 매치 날짜 변경 시 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인
	@RequestMapping(value="/admin/mcodeDuplCheck.do", method=RequestMethod.POST)
	public String mcodeDuplCheck(@RequestParam HashMap params, Model model) {
		// 모든 조건이 같을 경우 1, 날짜까지 같고 시간이 다를 경우 0, 없을 경우 -1 리턴
		int result = adminService.mcodeDuplCheck(params);
		model.addAttribute("ajax", result);
		return "ajax";
	}
	
	
	// 등록된 매치 리스트 페이지에서 매치 날짜 변경 메소드
	@RequestMapping(value="/admin/changeMdate.do", method=RequestMethod.POST)
	public String changeMdate(@RequestParam String mcode, @RequestParam String cdate, Model model) {
		System.out.println("mcode:"+mcode); // 변경하고자 하는 매치 코드
		System.out.println("mdate:"+cdate); // 변경 될 날짜
		
		int result = adminService.changeMdate(mcode, cdate);
		
		model.addAttribute("ajax", result);
		return "ajax";
	}
	
	// 등록된 매치 리스트 페이지에서 매치 삭제
	@RequestMapping(value="/admin/deleteMatch.do", method=RequestMethod.POST)
	public String deleteMatch(@RequestParam String[] array, Model model) {
		int total = array.length;
		int result = adminService.deleteMatch(array);
		String succrate = result+"/"+total;
		model.addAttribute("ajax", succrate);
		return "ajax";
	}
	
	// 등록된 매치 리스트 페이지에서 편집 버튼을 통해 라인업 불러오기
	@RequestMapping(value="/admin/getMatchDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Player> getMatchDetail(@RequestParam String mcode){
		System.out.println("gg");
		List<Player> list = adminService.getMatchDetail(mcode);
		for(Player player : list) {
			System.out.println(player.toString());
		}
		return list;
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
 
	// 클럽 생성 페이지에서 클럽 생성
	@RequestMapping("/admin/create_club_ok.do")
	public String createClub(Club mngclub, MultipartHttpServletRequest mRequest, ModelMap model) throws Exception {
		
		System.out.println("클럽 생성 서비스");
		
		model.addAttribute("emblem", mngclub.getEmblem());
		model.addAttribute("sphoto", mngclub.getSphoto());
		
		adminService.insertClub(mngclub);
		adminService.insertStadium(mngclub);
		
		return "redirect:/admin/club_view.do";
	}
	
	// 클럽 삭제 페이지
	@RequestMapping("/admin/delete_club.do")
	public String deleteClubView() {
		System.out.println("클럽 삭제 페이지");
		return "admin/club_delete";
	}
	
	// 클럽 삭제 페이지에서 클럽 삭제
	@RequestMapping("/admin/delete_club_ok.do")
	public String deleteClub(String cname, String cmanager, HttpServletResponse response) throws Exception{
		System.out.println("클럽 삭제");
		adminService.deleteClub(response, cname, cmanager);
//		mngServ.deleteStadium(ccode,);	//경기장 삭제
		return "redirect:/admin/club_view.do";
	}
	
	// 클럽정보 상세보기 페이지
	@RequestMapping("/admin/detail_club.do")
	public ModelAndView detailView(String ccode,HttpServletResponse response ) throws Exception {
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
	public ModelAndView updateclubView(String ccode, HttpServletResponse response ) throws Exception {
		
		System.out.println("클럽 수정 페이지");
		Club mngC = adminService.getClubDetail(ccode);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mngC", mngC);
		mv.setViewName("admin/club_update");
		
		return mv;
	}
	
	// 클럽 수정 페이지에서 클럽 수정
	@RequestMapping("/admin/update_club_ok.do")
	public String updateClub(Club mngClub) throws Exception{
		
		System.out.println("클럽 수정");
		
		adminService.updateClub(mngClub);
		adminService.updateStadium(mngClub);
		
		return "redirect:/admin/club_view.do";
		
	}
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
