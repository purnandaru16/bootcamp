package com.xsis.ex.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PENJUALAN")
public class Penjualan {
	
	public Penjualan() {
		
	}
	
	public Penjualan(int id, int items, int total, int kodeTransaksi, String statusBayar) {
		super();
		this.id = id;
		this.items = items;
		this.total = total;
		this.kodeTransaksi = kodeTransaksi;
		this.statusBayar = statusBayar;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	private int items;
	private int total;
	@Column(name="kode_transaksi")
	private int kodeTransaksi;
	@Column(name="status_bayar")
	private String statusBayar;
	
	//related to customer
	@ManyToOne
	private Customer customer;
	
	//related to detail_penjualan
	@OneToMany(mappedBy="penjualan")
	private List<DetailPenjualan> details;
	
	public List<DetailPenjualan> getDetails() {
		return details;
	}

	public void setDetails(List<DetailPenjualan> details) {
		this.details = details;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItems() {
		return items;
	}
	public void setItems(int items) {
		this.items = items;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getKodeTransaksi() {
		return kodeTransaksi;
	}
	public void setKodeTransaksi(int kodeTransaksi) {
		this.kodeTransaksi = kodeTransaksi;
	}
	public String getStatusBayar() {
		return statusBayar;
	}
	public void setStatusBayar(String statusBayar) {
		this.statusBayar = statusBayar;
	}
}
