package com.xsis.ex.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.ex.model.Pesanan;

@Repository
public class PesananDaoImpl implements PesananDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void save(Pesanan pesan) {
		Session session = sessionFactory.getCurrentSession();
		session.save(pesan);
		session.flush();
	}

	public List<Pesanan> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Pesanan.class).list();
	}

	public Pesanan getOne(Pesanan pesan) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Pesanan pesan) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Pesanan pesan) {
		// TODO Auto-generated method stub
		
	}

	public void saveOrUpdate(Pesanan pesan) {
		// TODO Auto-generated method stub
		
	}
}
