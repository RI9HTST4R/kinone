package com.project.kinone.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Member;

@Repository
public class MemberDAOImpl implements MemberDAOInter{

	@Autowired
	private SqlSessionTemplate session;
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////// 심 규 진
	////////////////////////////////////////////// /////////////////////////////////////////////////////////
	
	public Member logincheck(String email) {
		return session.selectOne("membermapper.logincheck", email);
	}
	public int join(Member member) {
		return session.insert("membermapper.insertJoin", member);
	}
	public String find_email(String register_email) {
		return session.selectOne("membermapper.find_email", register_email);
	}
	public Member emailfind(Member member) {
		return session.selectOne("membermapper.emailfind", member);
	}
	
	public int chagepasswd(Member member) {
		return session.update("membermapper.change_passwd",member);
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Member getMember(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("membermapper.getMember", email);
	}
	public int edit_member(Member member) {
		// TODO Auto-generated method stub
		return session.update("membermapper.edit_member", member);
	}
	public int disable_member(int mno) {
		// TODO Auto-generated method stub
		return session.update("membermapper.disable_member", mno);
	}

}
