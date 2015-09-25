package Hibernate.person;

/**
 * AbstractPerson entity provides the base persistence definition of the Person
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPerson implements java.io.Serializable {

	// Fields

	private Integer id;
	private String num;
	private String name;
	private String state;

	// Constructors

	/** default constructor */
	public AbstractPerson() {
	}

	/** full constructor */
	public AbstractPerson(String num, String name, String state) {
		this.num = num;
		this.name = name;
		this.state = state;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}