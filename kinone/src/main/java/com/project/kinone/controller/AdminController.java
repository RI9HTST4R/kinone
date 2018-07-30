package com.project.kinone.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.kinone.model.Match;
import com.project.kinone.service.AdminServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
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
		return "admin/matchForm";
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
	@RequestMapping(value="/admin/matchList.do", method=RequestMethod.GET)
	public String matchList(@RequestParam HashMap<String, String> params, Model model) {
		List<String> seasonList = adminService.getAllSeason();
		List<String> leagueList = adminService.getAllLeague();

		List<Match> matchList = adminService.getMatchList(params);
		
		model.addAttribute("leagueList", leagueList);
		model.addAttribute("seasonList", seasonList);
		model.addAttribute("matchList", matchList);
		return "admin/matchList";
	}
	
	// 매치 리스트 페이지에서 매치 날짜 변경 시 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인
	@RequestMapping(value="/admin/mcodeDuplCheck.do", method=RequestMethod.POST)
	public String mcodeDuplCheck(@RequestParam HashMap<String, String> params, Model model) {
		
		int count = adminService.mcodeDuplCheck(params);
		model.addAttribute("ajax", count);
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
}
