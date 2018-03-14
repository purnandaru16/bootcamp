package com.xsis.ex.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="DETAIL_PENJUALAN")
public class DetailPenjualan {
	
	public DetailPenjualan() {
		
	}
	
	public DetailPenjualan(int idDetailJual) {
		super();
		this.idDetailJual = idDetailJual;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id_dp")
	private int idDetailJual;
	
	//related to penjualan
	@ManyToOne
	private Penjualan penjualan;

	//related to barang
	@ManyToOne
	private Barang barang;
	
	public Penjualan getPenjualan() {
		return penjualan;
	}

	public void setPenjualan(Penjualan penjualan) {
		this.penjualan = penjualan;
	}

	public int getIdDetailJual() {
		return idDetailJual;
	}

	public void setIdDetailJual(int idDetailJual) {
		this.idDetailJual = idDetailJual;
	}
	
	
}
