package com.xsis.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.ex.model.Barang;
import com.xsis.ex.model.Customer;
import com.xsis.ex.model.Pesanan;
import com.xsis.ex.service.BarangService;
import com.xsis.ex.service.CustomerService;
import com.xsis.ex.service.PesananService;

@Controller
@RequestMapping("/order")
public class PesananController {
	
	@Autowired
	PesananService orderService;
	
	@Autowired
	CustomerService custService;
	
	@Autowired
	BarangService brgService;
	
	@RequestMapping
	public String index(Model model) {
		List<Pesanan> orders = orderService.selectAll();
		List<Customer> customers = custService.selectAll();
		List<Barang> barangs = brgService.selectAll();
		
		model.addAttribute("orders", orders);
		model.addAttribute("customers", customers);
		model.addAttribute("barangs", barangs);
		return "order";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Pesanan pesan) {
		orderService.save(pesan);
	}
}
