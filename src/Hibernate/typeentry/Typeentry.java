package Hibernate.typeentry;

/**
 * Typeentry entity. @author MyEclipse Persistence Tools
 */
public class Typeentry extends AbstractTypeentry implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Typeentry() {
	}

	/** full constructor */
	public Typeentry(String number, String name, Integer parentId) {
		super(number, name, parentId);
	}

}
