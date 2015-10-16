package Hibernate.sales;

import java.sql.Timestamp;

/**
 * Sales entity. @author MyEclipse Persistence Tools
 */
public class Sales extends AbstractSales implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Sales() {
	}

	/** full constructor */
	public Sales(Timestamp date, String week, Double amount) {
		super(date, week, amount);
	}

}
