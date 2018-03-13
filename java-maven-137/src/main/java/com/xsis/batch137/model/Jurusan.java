package com.xsis.batch137.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="JURUSAN137")
public class Jurusan {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	@Column(name="name_jurusan")
	private String nameJurusan;
	
	//related to mahasiswa
	@OneToMany(mappedBy="jurusan")
	private List<Mahasiswa> mhss; 
	
	public List<Mahasiswa> getMhss() {
		return mhss;
	}
	public void setMhss(List<Mahasiswa> mhss) {
		this.mhss = mhss;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameJurusan() {
		return nameJurusan;
	}
	public void setNameJurusan(String nameJurusan) {
		this.nameJurusan = nameJurusan;
	}
	public String getName() {
		return nameJurusan;
	}
	public void setName(String nameJurusan) {
		this.nameJurusan = nameJurusan;
	}
	
}
