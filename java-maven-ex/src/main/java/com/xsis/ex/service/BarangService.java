package com.xsis.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.ex.dao.BarangDao;
import com.xsis.ex.model.Barang;

@Service
@Transactional
public class BarangService {

	@Autowired
	BarangDao barangDao;
	
	public void save(Barang brg) {
		barangDao.save(brg);
	}
	
	public List<Barang> selectAll(){
		return barangDao.selectAll();
	}
	
	public Barang getOne(int idBrg) {
		Barang brg = new Barang();
		brg.setIdBrg(idBrg);
		return barangDao.getOne(brg);
	}
	
	public void update(Barang brg) {
		barangDao.update(brg);
	}
	
	public void delete(Barang brg) {
		barangDao.delete(brg);
	}
	
	public void saveOrUpdate(Barang brg) {
		barangDao.saveOrUpdate(brg);
	}
}
