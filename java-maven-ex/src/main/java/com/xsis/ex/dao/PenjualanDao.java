package com.xsis.ex.dao;

import java.util.List;

import com.xsis.ex.model.Penjualan;

public interface PenjualanDao {
	// create
	public void save(Penjualan jual);

	// selectAll
	public List<Penjualan> selectAll();

	// getOne
	public Penjualan getOne(Penjualan jual);

	// update
	public void update(Penjualan jual);

	// delete
	public void delete(Penjualan jual);

	// save or update
	public void saveOrUpdate(Penjualan jual);
}
