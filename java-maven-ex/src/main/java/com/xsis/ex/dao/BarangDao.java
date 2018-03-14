package com.xsis.ex.dao;

import java.util.List;

import com.xsis.ex.model.Barang;

public interface BarangDao {

	// create
	public void save(Barang brg);

	// selectAll
	public List<Barang> selectAll();

	// getOne
	public Barang getOne(Barang brg);

	// update
	public void update(Barang brg);

	// delete
	public void delete(Barang brg);

	// save or update
	public void saveOrUpdate(Barang brg);
}
