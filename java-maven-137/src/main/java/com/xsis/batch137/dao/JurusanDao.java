package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Jurusan;

public interface JurusanDao {

	// create
	public void save(Jurusan jur);

	// selectAll
	public List<Jurusan> selectAll();

	// getOne
	public Jurusan getOne(Jurusan jur);

	// update
	public void update(Jurusan jur);

	// delete
	public void delete(Jurusan jur);

	// save or update
	public void saveOrUpdate(Jurusan jur);
}
