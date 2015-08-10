package Hibernate.type;

/**
 * AbstractType entity provides the base persistence definition of the Type
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractType implements java.io.Serializable {

	// Fields

	private Integer id;
	private String number;
	private String name;
	private String parentid;

	// Constructors

	/** default constructor */
	public AbstractType() {
	}

	/** full constructor */
	public AbstractType(String number, String name, String parentid) {
		this.number = number;
		this.name = name;
		this.parentid = parentid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentid() {
		return this.parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

}