package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.service.EmployeeService;

@Controller
@RequestMapping("/ajax-emp") //REST
public class AjaxEmployeeController {

	@Autowired
	EmployeeService empService;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> emps = empService.selectAll();
		model.addAttribute("emps", emps);
		return "employee-ajax";
	}
	
	//======================================================================================================================//
	//save
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Employee emp) {
		empService.saveAtauUpdate(emp);
	}
	
	//get all
	@RequestMapping(value = "/get-all", method = RequestMethod.GET)
	@ResponseBody
	public List<Employee> getAll(){
		return empService.selectAll();
	}
	
	//get one
	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Employee getOne(@PathVariable int id) {
		return empService.getOne(id);
	}
	
	//update
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Employee emp) {
		empService.saveAtauUpdate(emp);
	}
	
	//delete
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		Employee emp = new Employee();
		emp.setId(id);
		emp.setEmail("-");
		empService.delete(emp);
	}
}
