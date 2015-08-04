package Hibernate.queEntry;

/**
 * Queentry entity. @author MyEclipse Persistence Tools
 */
public class Queentry extends AbstractQueentry implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Queentry() {
	}

	/** full constructor */
	public Queentry(Integer parentId, String desc) {
		super(parentId, desc);
	}

}
