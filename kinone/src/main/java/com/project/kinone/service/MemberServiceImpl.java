package com.project.kinone.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.MemberDAOImpl;
import com.project.kinone.model.Member;


import com.project.kinone.dao.MemberDAOImpl;
import com.project.kinone.model.Member;

@Service
public class MemberServiceImpl implements MemberServiceInter{
	MemberDAOImpl MemberDAO;
	
	@Autowired
	private MemberDAOImpl memberDAO;
	
	

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	public int logincheck(Member member) {
		return MemberDAO.logincheck(member);
	}
	
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	//////////////////////////////////////////////김 동 환
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	
	public int insertJoin(Member member) {
		return memberDAO.join(member);
	}

	public String find_email(String register_email) {
		// TODO Auto-generated method stub
		return memberDAO.find_email(register_email);
	}
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

}
