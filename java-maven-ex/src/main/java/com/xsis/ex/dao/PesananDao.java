package com.xsis.ex.dao;

import java.util.List;

import com.xsis.ex.model.Pesanan;

public interface PesananDao {

	// create
	public void save(Pesanan pesan);

	// selectAll
	public List<Pesanan> selectAll();

	// getOne
	public Pesanan getOne(Pesanan pesan);

	// update
	public void update(Pesanan pesan);

	// delete
	public void delete(Pesanan pesan);

	// save or update
	public void saveOrUpdate(Pesanan pesan);
}
