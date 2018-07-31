package com.project.kinone.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.project.kinone.model.ManagerClub;

public interface AdminClubService {

	public List<ManagerClub> getMngClubList() throws Exception;
	
	public void insertClub(ManagerClub mngClub) throws Exception;
	public void insertStadium(ManagerClub mngClub) throws Exception;
	
	public int deleteClub(HttpServletResponse response, String cname, String cmanager) throws Exception;

	public ManagerClub getClubDetail(String ccode) throws Exception;
	
	public void updateClub(ManagerClub mngClub) throws Exception;
	public void updateStadium(ManagerClub mngClub) throws Exception;
}
