package com.xsis.ex.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.ex.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void save(Customer cust) {
		Session session = sessionFactory.getCurrentSession();
		session.save(cust);
		session.flush();
	}

	public List<Customer> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Customer.class).list();
	}

	public Customer getOne(Customer cust) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Customer.class, cust.getId());
	}

	public void update(Customer cust) {
		Session session = sessionFactory.getCurrentSession();
		session.update(cust);
		session.flush();
	}

	public void delete(Customer cust) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(cust);
		session.flush();
	}

	public void saveOrUpdate(Customer cust) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cust);
		session.flush();
	}

}
