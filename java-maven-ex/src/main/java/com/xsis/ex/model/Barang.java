package com.xsis.ex.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="BARANG")
public class Barang {

	public Barang() {
		
	}
	
	public Barang(int idBrg, String namaBarang, int harga, int stok) {
		super();
		this.idBrg = idBrg;
		this.namaBarang = namaBarang;
		this.harga = harga;
		this.stok = stok;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "idbrg")
	@SequenceGenerator(initialValue = 1, name = "idbrg", sequenceName = "idbrg")
	@Column(name="id_brg")
	private int idBrg;
	@Column(name="nama_barang")
	private String namaBarang;
	private int harga;
	private int stok;
	
	//related to detail_penjualan
	@OneToMany(mappedBy="barang")
	private List<DetailPenjualan> details;
	
	//related to pesanan
	@OneToMany(mappedBy="barang")
	private List<Pesanan> pesanans;
	
	public List<DetailPenjualan> getDetails() {
		return details;
	}

	public void setDetails(List<DetailPenjualan> details) {
		this.details = details;
	}
	public int getIdBrg() {
		return idBrg;
	}
	public void setIdBrg(int idBrg) {
		this.idBrg = idBrg;
	}
	public String getNamaBarang() {
		return namaBarang;
	}
	public void setNamaBarang(String namaBarang) {
		this.namaBarang = namaBarang;
	}
	public int getHarga() {
		return harga;
	}
	public void setHarga(int harga) {
		this.harga = harga;
	}
	public int getStok() {
		return stok;
	}
	public void setStok(int stok) {
		this.stok = stok;
	}
	
	
}
