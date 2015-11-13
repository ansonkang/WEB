package Hibernate.sales_brand;

import java.sql.Timestamp;

/**
 * SalesBrandId entity. @author MyEclipse Persistence Tools
 */
public class SalesBrandId extends AbstractSalesBrandId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SalesBrandId() {
	}

	/** full constructor */
	public SalesBrandId(Timestamp date, String brand, Double amount) {
		super(date, brand, amount);
	}

}
