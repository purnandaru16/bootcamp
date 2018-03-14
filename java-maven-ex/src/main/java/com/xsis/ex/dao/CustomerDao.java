package com.xsis.ex.dao;

import java.util.List;

import com.xsis.ex.model.Customer;

public interface CustomerDao {
	// create
	public void save(Customer cust);

	// selectAll
	public List<Customer> selectAll();

	// getOne
	public Customer getOne(Customer cust);

	// update
	public void update(Customer cust);

	// delete
	public void delete(Customer cust);

	// save or update
	public void saveOrUpdate(Customer cust);
}
