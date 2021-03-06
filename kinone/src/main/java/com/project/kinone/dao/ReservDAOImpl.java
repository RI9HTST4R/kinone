package com.project.kinone.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Reservation;

@Repository
public class ReservDAOImpl implements ReservDAOInter{

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Reservation> getSeatsList(String mcode) {
		// TODO Auto-generated method stub
		return session.selectList("reservmapper.getSeatsList", mcode);
	}
	
	public int getTickets(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("reservmapper.getTickets", map);
	}
	public Reservation checkReserv(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.selectOne("reservmapper.checkReserv", reservation);
	}
	public int insertReserve(List<Reservation> list) {
		// TODO Auto-generated method stub
		return session.insert("reservmapper.insertReserve", list);
	}

	public List<Reservation> getAllTickets(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return session.selectList("reservmapper.getAllTickets", map);
	}

	public Reservation getTheTicket(String rcode) {
		// TODO Auto-generated method stub
		return session.selectOne("reservmapper.getTheTicket", rcode);
	}

	public int cancel_reservation(String rcode) {
		// TODO Auto-generated method stub
		return session.update("reservmapper.cancel_reservation", rcode);
	}

	public int getTicketsCount(int mno) {
		// TODO Auto-generated method stub
		return session.selectOne("reservmapper.getTicketsCount",mno);
	}
	
	
	
}
