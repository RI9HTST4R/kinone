package com.project.kinone.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.AdminClubDAOImpl;
import com.project.kinone.model.ManagerClub;

@Service
public class AdminClubServiceImpl implements AdminClubService {

	@Autowired
	private AdminClubDAOImpl mngClubDao;

	@Override
	public List<ManagerClub> getMngClubList() throws Exception {
		// TODO Auto-generated method stub
		return mngClubDao.getClubList();
	}

	@Override
	public void insertClub(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mngClub);
		mngClubDao.insertClub(mngClub);
	}

	@Override
	public void insertStadium(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		mngClubDao.insertStadium(mngClub);
	}

	@Override
	public int deleteClub(HttpServletResponse response, String cname, String cmanager) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("delete service");

		ManagerClub mclub = mngClubDao.getClubCont(cname);
		int result = 0;
		if (!mclub.getCmanager().equals(cmanager)) {
			out.println("<script>");
			out.println("alert('감독이 일치하지 않다!')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();

			return result;

		} else {
			mngClubDao.deleteClub(cname);

			result = 1;
		}
		return result;
	}

	public ManagerClub getClubDetail(String ccode) throws Exception {
		// TODO Auto-generated method stub
		ManagerClub mngClub = mngClubDao.getClubDetail(ccode);

		return mngClub;
	}

	@Override
	public void updateClub(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service입니다." + mngClub.getCcode());
		mngClubDao.updateClub(mngClub);
	}

	@Override
	public void updateStadium(ManagerClub mngClub) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mngClub.getCcode());
		mngClubDao.updateStadium(mngClub);
	}



}
