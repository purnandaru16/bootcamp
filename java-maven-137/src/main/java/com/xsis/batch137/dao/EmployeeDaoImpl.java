package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void save(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.save(emp);
		session.flush();
	}

	public List<Employee> selectAll() {
		// HQL = hibernate query language
		String hql = "from Employee";
		Session session = sessionFactory.getCurrentSession();
		
		// pake fitur
		// session.createCriteria(Employee.class).list();
		
		// pake hql
		List<Employee> emps = session.createQuery(hql).list();
		
		if(emps.isEmpty())
			return null;
		else
		return emps;
	}

	public Employee getOne(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		
		// pake fitur
		// Employee employee = session.get(Employee.class, emp.getId());
		
		//pake hql
		String hql = "from Employee emp where emp.id = :empid";
		List<Employee> emps = session.createQuery(hql).setParameter("empid", emp.getId()).list();
		Employee employee = emps.get(0);
		
		if(emps.isEmpty())
			return null;
		else
		return employee;
	}

	public void update(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.update(emp);
		session.flush();
	}

	public void delete(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(emp);
		session.flush();
	}

	public void saveAtauUpdate(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(emp);
		session.flush();
	}
	
}
