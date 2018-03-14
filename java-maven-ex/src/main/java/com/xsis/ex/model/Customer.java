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
@Table(name = "CUSTOMER")
public class Customer {

	public Customer() {

	}

	public Customer(int id, String custName, String address, String contact) {
		super();
		this.id = id;
		this.custName = custName;
		this.address = address;
		this.contact = contact;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idcust")
	@SequenceGenerator(initialValue = 1, name = "idcust", sequenceName = "idcust")
	private int id;
	@Column(name = "cust_name")
	private String custName;
	private String address;
	private String contact;

	// related to penjualan
	@OneToMany(mappedBy = "customer")
	private List<Penjualan> juals;

	// related to penjualan
	@OneToMany(mappedBy = "customer")
	private List<Pesanan> pesanans;

	public List<Penjualan> getJuals() {
		return juals;
	}

	public void setJuals(List<Penjualan> juals) {
		this.juals = juals;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
