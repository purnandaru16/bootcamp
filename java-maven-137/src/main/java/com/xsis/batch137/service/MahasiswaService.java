package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.MahasiswaDao;
import com.xsis.batch137.model.Mahasiswa;

@Service
@Transactional
public class MahasiswaService {

	@Autowired
	MahasiswaDao mhsDao;

	public void save(Mahasiswa mhs) {
		mhsDao.save(mhs);
	}

	public List<Mahasiswa> selectAll() {
		return mhsDao.selectAll();
	}

	public Mahasiswa getOne(int id) {
		Mahasiswa mhs = new Mahasiswa();
		mhs.setId(id);
		mhs.setName("-");
		return mhsDao.getOne(mhs);
	}

	public void update(Mahasiswa mhs) {
		mhsDao.update(mhs);
	}

	public void delete(Mahasiswa mhs) {
		mhsDao.delete(mhs);
	}

	public void saveOrUpdate(Mahasiswa mhs) {
		mhsDao.saveOrUpdate(mhs);
	}
}
