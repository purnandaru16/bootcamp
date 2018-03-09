package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.EmployeeDao;
import com.xsis.batch137.dao.EmployeeDaoImpl;
import com.xsis.batch137.model.Employee;

@Service
@Transactional
public class EmployeeService {
	
	@Autowired
	EmployeeDao empDao;
	
	public void save(Employee emp) {
		empDao.save(emp);
	}
	
	public List<Employee> selectAll(){
		return empDao.selectAll();
	}
	
	public void delete(Employee emp) {
		empDao.delete(emp);
	}
	
	public void update(Employee emp) {
		empDao.update(emp);
	}
	
	public void saveAtauUpdate(Employee emp) {
		empDao.saveAtauUpdate(emp);
	}

	public Employee getOne(int id) {
		Employee emp = new Employee();
		emp.setId(id);
		return empDao.getOne(emp);
		
	}
}
