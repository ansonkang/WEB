package Hibernate.sales_brand;

/**
 * SalesBrand entity. @author MyEclipse Persistence Tools
 */
public class SalesBrand extends AbstractSalesBrand implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SalesBrand() {
	}

	/** full constructor */
	public SalesBrand(SalesBrandId id) {
		super(id);
	}

}
