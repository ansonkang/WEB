package Hibernate.sales_brand;

/**
 * AbstractSalesBrand entity provides the base persistence definition of the
 * SalesBrand entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSalesBrand implements java.io.Serializable {

	// Fields

	private SalesBrandId id;

	// Constructors

	/** default constructor */
	public AbstractSalesBrand() {
	}

	/** full constructor */
	public AbstractSalesBrand(SalesBrandId id) {
		this.id = id;
	}

	// Property accessors

	public SalesBrandId getId() {
		return this.id;
	}

	public void setId(SalesBrandId id) {
		this.id = id;
	}

}