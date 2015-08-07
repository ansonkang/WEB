package Hibernate.que;

/**
 * Que entity. @author MyEclipse Persistence Tools
 */
public class Que extends AbstractQue implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Que() {
	}

	/** full constructor */
	public Que(String queNum, String queDesc) {
		super(queNum, queDesc, queDesc);
	}

}
