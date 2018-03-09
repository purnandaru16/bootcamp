//package com.xsis.batch137.service;
//
//import java.util.List;
//
//import javax.annotation.PostConstruct;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.xsis.batch137.model.Employee;
//
//@Service
//@Transactional
//public class initService {
//	
//	@Autowired
//	EmployeeService empService;
//	//save
//	@PostConstruct
//	public void init() {
//		Employee emp = new Employee();
//		emp.setId(1);
//		emp.setName("andar");
//		emp.setAddress("wangon");
//		emp.setSalary(5000.0);
//		emp.setEmail("k@mail");
////		empService.save(emp);
//		empService.saveAtauUpdate(emp);
////		this.deleteEmp(13);
//		this.getDataEmployee();
//		
//	}
//	
//	// getAllData
//	public void getDataEmployee() {
//		List<Employee> emps = empService.selectAll();
//		for(Employee emp: emps) {
//			System.out.println("ID : "+ emp.getId() +", name : "+emp.getName());
//		}
//	}
//	
//	// delete
//	public void deleteEmp(int id) {
//		Employee emp = new Employee();
//		emp.setId(id);
//		emp.setEmail("-");
//		empService.delete(emp);
//	}
//}
