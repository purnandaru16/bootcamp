package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Mahasiswa;

@Repository
public class MahasiswaDaoImpl implements MahasiswaDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void save(Mahasiswa mhs) {
		Session session = sessionFactory.getCurrentSession();
		session.save(mhs);
		session.flush();
	}

	public List<Mahasiswa> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Mahasiswa.class).list();
	}

	public Mahasiswa getOne(Mahasiswa mhs) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Mahasiswa.class, mhs.getId());
	}

	public void update(Mahasiswa mhs) {
		Session session = sessionFactory.getCurrentSession();
		session.update(mhs);
		session.flush();
	}

	public void delete(Mahasiswa mhs) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(mhs);
		session.flush();
	}

	public void saveOrUpdate(Mahasiswa mhs) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(mhs);
		session.flush();
	}
}
