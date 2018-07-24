package com.project.kinone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.service.ClubServiceImpl;

@Controller
public class FrontController {
	
	@Autowired
	private ClubServiceImpl clubService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model) {
		
		List<Club> clubList = clubService.getClubList();
		System.out.println(clubList.toString());
		
		int seasoncode = 2018;
		String lcode = "K1";
		List<Club_season> k1ClubSeasonInfoList = clubService.getClubSeasonInfoList(seasoncode,lcode);
		lcode = "K2";
		List<Club_season> k2ClubSeasonInfoList = clubService.getClubSeasonInfoList(seasoncode,lcode);
		
		model.addAttribute("clubList", clubList);
		model.addAttribute("k1ClubSeasonInfoList", k1ClubSeasonInfoList);
		model.addAttribute("k2ClubSeasonInfoList", k2ClubSeasonInfoList);
		
		return "main";
	}
}
