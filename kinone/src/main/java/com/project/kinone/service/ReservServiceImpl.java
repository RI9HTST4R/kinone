package com.project.kinone.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.kinone.dao.ReservDAOImpl;

public class ReservServiceImpl implements ReservServiceInter{

	@Autowired
	private ReservDAOImpl reservDao;
}
