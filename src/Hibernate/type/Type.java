package Hibernate.type;

/**
 * Type entity. @author MyEclipse Persistence Tools
 */
public class Type extends AbstractType implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Type() {
	}

	/** full constructor */
	public Type(String number, String name, String parentid) {
		super(number, name, parentid);
	}

}
