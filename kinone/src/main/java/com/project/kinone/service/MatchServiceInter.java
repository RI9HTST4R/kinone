package com.project.kinone.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.project.kinone.model.Match;

public interface MatchServiceInter {

	public List<Date> get7MatchDays(String lcode);

	HashMap<String, HashMap> getAllMatchInDay(List<Date> k1MatchDays, String lcode);
}
