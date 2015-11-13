package Hibernate.sales_brand;

import java.sql.Timestamp;

/**
 * AbstractSalesBrandId entity provides the base persistence definition of the
 * SalesBrandId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSalesBrandId implements java.io.Serializable {

	// Fields

	private Timestamp date;
	private String brand;
	private Double amount;

	// Constructors

	/** default constructor */
	public AbstractSalesBrandId() {
	}

	/** full constructor */
	public AbstractSalesBrandId(Timestamp date, String brand, Double amount) {
		this.date = date;
		this.brand = brand;
		this.amount = amount;
	}

	// Property accessors

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractSalesBrandId))
			return false;
		AbstractSalesBrandId castOther = (AbstractSalesBrandId) other;

		return ((this.getDate() == castOther.getDate()) || (this.getDate() != null
				&& castOther.getDate() != null && this.getDate().equals(
				castOther.getDate())))
				&& ((this.getBrand() == castOther.getBrand()) || (this
						.getBrand() != null && castOther.getBrand() != null && this
						.getBrand().equals(castOther.getBrand())))
				&& ((this.getAmount() == castOther.getAmount()) || (this
						.getAmount() != null && castOther.getAmount() != null && this
						.getAmount().equals(castOther.getAmount())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getDate() == null ? 0 : this.getDate().hashCode());
		result = 37 * result
				+ (getBrand() == null ? 0 : this.getBrand().hashCode());
		result = 37 * result
				+ (getAmount() == null ? 0 : this.getAmount().hashCode());
		return result;
	}

}