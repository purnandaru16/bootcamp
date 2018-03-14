package com.xsis.ex.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="PESANAN")
public class Pesanan {

	public Pesanan() {
		
	}
	
	public Pesanan(int id, int jmlBarang, int status) {
		super();
		this.id = id;
		this.jmlBarang = jmlBarang;
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idpesan")
	@SequenceGenerator(initialValue = 1, name = "idpesan", sequenceName = "idpesan")
	private int id;
	@Column(name="jml_barang")
	private int jmlBarang;
	private int status;
	
	@ManyToOne
	private Customer customer;
	
	@ManyToOne
	private Barang barang;
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Barang getBarang() {
		return barang;
	}

	public void setBarang(Barang barang) {
		this.barang = barang;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJmlBarang() {
		return jmlBarang;
	}
	public void setJmlBarang(int jmlBarang) {
		this.jmlBarang = jmlBarang;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
