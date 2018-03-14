package com.xsis.ex.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.ex.model.Penjualan;

@Repository
public class PenjualanDaoImpl implements PenjualanDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void save(Penjualan jual) {
		// TODO Auto-generated method stub
		
	}

	public List<Penjualan> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Penjualan.class).list();
	}

	public Penjualan getOne(Penjualan jual) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Penjualan jual) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Penjualan jual) {
		// TODO Auto-generated method stub
		
	}

	public void saveOrUpdate(Penjualan jual) {
		// TODO Auto-generated method stub
		
	}

}
