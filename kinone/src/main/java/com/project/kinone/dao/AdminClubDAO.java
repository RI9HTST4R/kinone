package com.project.kinone.dao;

import java.util.List;

import com.project.kinone.model.ManagerClub;

public interface AdminClubDAO {
	
	public List<ManagerClub> getClubList() throws Exception;  
	
	public void insertClub(ManagerClub mngClub) throws Exception;
	public void insertStadium(ManagerClub mngClub) throws Exception;
	
	public ManagerClub getClubCont(String cname) throws Exception;
	
	public void deleteClub(String cname) throws Exception;
	
	public ManagerClub getClubDetail(String ccode) throws Exception;
	
	public void updateClub(ManagerClub mngClub) throws Exception;
	public void updateStadium(ManagerClub mngClub) throws Exception;
}
