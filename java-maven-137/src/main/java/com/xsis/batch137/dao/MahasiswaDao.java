package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Mahasiswa;

public interface MahasiswaDao {
	// create
	public void save(Mahasiswa mhs);

	// selectAll
	public List<Mahasiswa> selectAll();

	// getOne
	public Mahasiswa getOne(Mahasiswa mhs);

	// update
	public void update(Mahasiswa mhs);

	// delete
	public void delete(Mahasiswa mhs);

	// save or update
	public void saveOrUpdate(Mahasiswa mhs);
}
