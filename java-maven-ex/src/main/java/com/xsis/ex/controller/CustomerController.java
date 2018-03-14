package com.xsis.ex.controller;

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

import com.xsis.ex.model.Customer;
import com.xsis.ex.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService custService;
	
	@RequestMapping
	public String index(Model model) {
		List<Customer> customers = custService.selectAll();
		model.addAttribute("customers", customers);
		return "customer";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Customer cust) {
		custService.save(cust);
	}
	
	@RequestMapping(value="/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Customer getOne(@PathVariable int id) {
		return custService.getOne(id);
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		Customer cust = new Customer();
		cust.setId(id);
		custService.delete(cust);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Customer cust) {
		custService.update(cust);
	}
}
