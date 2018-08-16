package com.project.kinone.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReservDAOImpl implements ReservDAOInter{

	@Autowired
	private SqlSessionTemplate session;
}
