package com.project.kinone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.ReservDAOImpl;

@Service
public class ReservServiceImpl implements ReservServiceInter{

	@Autowired
	private ReservDAOImpl reservDao;
}
