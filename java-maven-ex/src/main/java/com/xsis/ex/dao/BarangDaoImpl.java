package com.xsis.ex.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.ex.model.Barang;

@Repository
public class BarangDaoImpl implements BarangDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Barang brg) {
		Session session = sessionFactory.getCurrentSession();
		session.save(brg);
		session.flush();
	}

	public List<Barang> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Barang.class).list();
	}

	public Barang getOne(Barang brg) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Barang.class, brg.getIdBrg());
	}

	public void update(Barang brg) {
		Session session = sessionFactory.getCurrentSession();
		session.update(brg);
		session.flush();
	}

	public void delete(Barang brg) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(brg);
		session.flush();
	}

	public void saveOrUpdate(Barang brg) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(brg);
		session.flush();
	}

}
