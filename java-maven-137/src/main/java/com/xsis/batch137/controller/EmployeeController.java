package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	EmployeeService empService;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> emps = empService.selectAll();
		model.addAttribute("emps", emps);
		return "employee";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute Employee emp) {
		empService.saveAtauUpdate(emp);
		return "redirect:/employee";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Employee emp = new Employee();
		emp.setId(id);
		emp.setEmail("-");
		empService.delete(emp);
		return "redirect:/employee";
	}
	
	@RequestMapping(value = "/editpage/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable int id, Model model) {
		Employee emp = empService.getOne(id);
		model.addAttribute("emp", emp);
		return "editpage";
	}
}
