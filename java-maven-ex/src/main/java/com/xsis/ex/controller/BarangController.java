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

import com.xsis.ex.model.Barang;
import com.xsis.ex.service.BarangService;

@Controller
@RequestMapping("/barang")
public class BarangController {

	@Autowired
	BarangService brgService;
	
	@RequestMapping
	public String index(Model model) {
		List<Barang> barangs = brgService.selectAll();
		model.addAttribute("barangs", barangs);
		return "barang";
	}
	
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Barang brg) {
		brgService.save(brg);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Barang brg) {
		brgService.update(brg);
	}
	
	@RequestMapping(value = "/get-one/{idBrg}", method = RequestMethod.GET)
	@ResponseBody
	public Barang getOne(@PathVariable int idBrg) {
		return brgService.getOne(idBrg);
	}
	
	@RequestMapping(value = "/delete/{idBrg}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int idBrg) {
		Barang brg = new Barang();
		brg.setIdBrg(idBrg);
		brgService.delete(brg);
	}
}
