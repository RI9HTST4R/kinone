package com.project.kinone.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservDAOImpl implements ReservDAOInter{

	@Autowired
	private SqlSessionTemplate session;
}
