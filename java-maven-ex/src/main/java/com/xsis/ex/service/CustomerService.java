package com.xsis.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.ex.dao.CustomerDao;
import com.xsis.ex.model.Customer;

@Service
@Transactional
public class CustomerService {

	@Autowired
	CustomerDao custDao;
	
	public void save(Customer cust) {
		custDao.save(cust);
	}
	
	public List<Customer> selectAll(){
		return custDao.selectAll();
	}
	
	public Customer getOne(int id) {
		Customer cust = new Customer();
		cust.setId(id);
		return custDao.getOne(cust);
	}
	
	public void update(Customer cust) {
		custDao.update(cust);
	}
	
	public void delete(Customer cust) {
		custDao.delete(cust);
	}
	
	public void saveOrUpdate(Customer cust) {
		custDao.saveOrUpdate(cust);
	}
}
