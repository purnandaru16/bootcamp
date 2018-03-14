package com.xsis.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.ex.dao.PesananDao;
import com.xsis.ex.model.Pesanan;

@Service
@Transactional
public class PesananService {

	@Autowired
	PesananDao orderDao;
	
	public void save(Pesanan pesan) {
		orderDao.save(pesan);
	}
	
	public List<Pesanan> selectAll(){
		return orderDao.selectAll();
	}
}
