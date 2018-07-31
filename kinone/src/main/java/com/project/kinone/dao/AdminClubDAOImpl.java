package com.project.kinone.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.ManagerClub;

@Repository
public class AdminClubDAOImpl implements AdminClubDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ManagerClub> getClubList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminmapper.mngClubList");
	}
	
	@Override
	public void insertClub(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mngClub.getCcode());
		sqlSession.insert("adminmapper.mngInsertClub", mngClub);
	}

	@Override
	public void insertStadium(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mngClub.getCcode());
		sqlSession.insert("adminmapper.mngInsertStadium", mngClub);
	}

	@Override
	public ManagerClub getClubCont(String cname) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("getClubCont cname"+cname);
		return (ManagerClub)sqlSession.selectOne("adminmapper.mngClubCont", cname);
	}
	
	@Override
	public void deleteClub(String cname) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("deleteClub cname " + cname);
		sqlSession.update("adminmapper.mngDeleteClub", cname);
	}
	
	@Override
	public ManagerClub getClubDetail(String ccode) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("getClubDetail ccode" + ccode);
		return sqlSession.selectOne("adminmapper.mngClubDetail", ccode);
	}


	@Override
	public void updateClub(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub		
		System.out.println("updateClub " + mngClub.getCcode());
		sqlSession.update("adminmapper.mngUpdateClub", mngClub);
	}

	@Override
	public void updateStadium(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("adminmapper.mngUpdateStadium", mngClub);		
	}


	
	
}
