package com.project.kinone.service;

import org.springframework.stereotype.Service;

import com.project.kinone.dao.MemberDAOImpl;
import com.project.kinone.model.Member;

@Service
public class MemberServiceImpl implements MemberServiceInter{
	MemberDAOImpl MemberDAO;
	
	
	
	

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	public int logincheck(Member member) {
		return MemberDAO.logincheck(member);
	}
	
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
}
