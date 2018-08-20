package com.project.kinone.service;

import org.springframework.stereotype.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.MemberDAOImpl;
import com.project.kinone.model.Member;


import com.project.kinone.dao.MemberDAOImpl;
import com.project.kinone.model.Member;

@Service
public class MemberServiceImpl implements MemberServiceInter{
	
	@Autowired
	private MemberDAOImpl memberDAO;
	
	

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	public Member logincheck(String email) {
		return memberDAO.logincheck(email);
	}
	public int chagepasswd(Member member) {
		return memberDAO.chagepasswd(member);
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
	public String emailfind(Member member) {
		return memberDAO.emailfind(member);
	}
	////////////////////////////////////////////// /////////////////////////////////////////////////////////

	public Member getMember(String email) {
		// TODO Auto-generated method stub
		return memberDAO.getMember(email);
	}
	public int edit_member(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.edit_member(member);
	}
	public int disable_member(int mno) {
		// TODO Auto-generated method stub
		return memberDAO.disable_member(mno);
	}

}
