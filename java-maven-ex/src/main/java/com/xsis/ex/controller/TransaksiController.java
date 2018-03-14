package com.xsis.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsis.ex.model.Barang;
import com.xsis.ex.model.Customer;
import com.xsis.ex.service.BarangService;
import com.xsis.ex.service.CustomerService;

@Controller
@RequestMapping("/transaksi")
public class TransaksiController {

	@Autowired
	BarangService brgService;
	
	@Autowired
	CustomerService custService;
	
	@RequestMapping
	public String index(Model model) {
		List<Barang> barangs = brgService.selectAll();
		List<Customer> customers = custService.selectAll(); 
		model.addAttribute("barangs", barangs);
		model.addAttribute("customers", customers);
		return "transaksi";
	}
}
