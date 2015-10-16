package Hibernate.sales;

import java.sql.Timestamp;

/**
 * AbstractSales entity provides the base persistence definition of the Sales
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSales implements java.io.Serializable {

	// Fields

	private Integer id;
	private Timestamp date;
	private String week;
	private Double amount;

	// Constructors

	/** default constructor */
	public AbstractSales() {
	}

	/** full constructor */
	public AbstractSales(Timestamp date, String week, Double amount) {
		this.date = date;
		this.week = week;
		this.amount = amount;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getWeek() {
		return this.week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

}