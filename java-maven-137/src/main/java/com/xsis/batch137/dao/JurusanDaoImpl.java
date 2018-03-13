package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Jurusan;

@Repository
public class JurusanDaoImpl implements JurusanDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Jurusan jur) {
		
	}

	public List<Jurusan> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Jurusan.class).list();
	}

	public Jurusan getOne(Jurusan jur) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Jurusan jur) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Jurusan jur) {
		// TODO Auto-generated method stub
		
	}

	public void saveOrUpdate(Jurusan jur) {
		// TODO Auto-generated method stub
		
	}

}
