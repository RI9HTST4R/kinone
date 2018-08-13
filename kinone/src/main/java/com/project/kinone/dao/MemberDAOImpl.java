package com.project.kinone.dao;

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
	
	public int logincheck(Member member) {
		return session.selectOne("membermapper.logincheck", member);
	}
	public int join(Member member) {
		return session.insert("membermapper.insertJoin", member);
	}
	public String find_email(String register_email) {
		// TODO Auto-generated method stub
		return session.selectOne("membermapper.find_email", register_email);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
