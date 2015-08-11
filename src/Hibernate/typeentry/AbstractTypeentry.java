package Hibernate.typeentry;

/**
 * AbstractTypeentry entity provides the base persistence definition of the
 * Typeentry entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTypeentry implements java.io.Serializable {

	// Fields

	private Integer id;
	private String number;
	private String name;
	private Integer parentId;

	// Constructors

	/** default constructor */
	public AbstractTypeentry() {
	}

	/** full constructor */
	public AbstractTypeentry(String number, String name, Integer parentId) {
		this.number = number;
		this.name = name;
		this.parentId = parentId;
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

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

}