package com.project.kinone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.kinone.model.Match;
import com.project.kinone.service.MatchServiceImpl;

@Controller
public class MatchController {

	@Autowired
	MatchServiceImpl matchService;
	
	@RequestMapping(value = "/match/matchInDay.do", method=RequestMethod.GET)
	public String matchInDay(@RequestParam String day, @RequestParam String lcode, @RequestParam String currentPage, Model model) {
		System.out.println("day : "+day+" lcode : "+lcode+" currentPage : "+currentPage);
	//	List<Match> matchListInDay = matchService.getMatchInDay(day, lcode, currentPage);
	//	System.out.println("matchListInDay : "+matchListInDay);
		
//		String ajax = "[";
//		for(int i=0; i<matchListInDay.size(); i++) {
//			ajax += "{";
//			ajax += "\"mcode\": \""+matchListInDay.get(i).getMcode()+"\","
//				  + "\"lcode\": \""+matchListInDay.get(i).getLcode()+"\","
//				  + "\"mdate\": \""+matchListInDay.get(i).getMdate()+"\","
//				  + "\"mround\": \""+matchListInDay.get(i).getMround()+"\","
//				  + "\"mstatus\": \""+matchListInDay.get(i).getMstatus()+"\","
//				  + "\"ccode_home\": \""+matchListInDay.get(i).getCcode_home()+"\","
//				  + "\"ccode_away\": \""+matchListInDay.get(i).getCcode_away()+"\","
//				  + "\"homescore\": \""+matchListInDay.get(i).getHomescore()+"\","
//				  + "\"awayscore\": \""+matchListInDay.get(i).getAwayscore()+"\","
//				  + "\"cname_short_h\": \""+matchListInDay.get(i).getCname_short_h()+"\","
//				  + "\"emblem_h\": \""+matchListInDay.get(i).getEmblem_h()+"\","
//				  + "\"cname_short_a\": \""+matchListInDay.get(i).getCname_short_a()+"\","
//				  + "\"emblem_a\": \""+matchListInDay.get(i).getEmblem_a()+"\""
//				  + "}";
//			if(i != matchListInDay.size()-1) ajax += ",";
//		}
//		ajax += "]";
//		System.out.println(ajax);
//		model.addAttribute("ajax", ajax);
		
		return "ajax";
	}
}
