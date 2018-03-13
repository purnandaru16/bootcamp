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
import com.xsis.batch137.model.Jurusan;
import com.xsis.batch137.model.Mahasiswa;
import com.xsis.batch137.service.JurusanService;
import com.xsis.batch137.service.MahasiswaService;

@Controller
@RequestMapping("/mhs")
public class MhsController {

	@Autowired
	MahasiswaService mhsService;
	@Autowired
	JurusanService jurService;

	@RequestMapping
	public String index(Model model) {
		List<Mahasiswa> mhss = mhsService.selectAll();
		List<Jurusan> jurs = jurService.selectAll();
		model.addAttribute("mhss", mhss);
		model.addAttribute("jurs", jurs);
		return "mahasiswa";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void index(@RequestBody Mahasiswa mhs) {
		mhsService.save(mhs);
	}

	@RequestMapping(value = "/get-one/{id}")
	@ResponseBody
	public Mahasiswa getOne(@PathVariable int id) {
		return mhsService.getOne(id);
	}

	// delete
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable int id) {
		Mahasiswa mhs = new Mahasiswa();
		mhs.setId(id);
		mhs.setName("-");
		mhsService.delete(mhs);
	}
	
	//update
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Mahasiswa mhs) {
		mhsService.update(mhs);
	}

}
