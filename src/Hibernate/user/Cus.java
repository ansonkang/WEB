package Hibernate.user;

/**
 * Cus entity. @author MyEclipse Persistence Tools
 */
public class Cus extends AbstractCus implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Cus() {
	}

	/** minimal constructor */
	public Cus(String name) {
		super(name);
	}

	/** full constructor */
	public Cus(String name, String psWord) {
		super(name, psWord);
	}

}
