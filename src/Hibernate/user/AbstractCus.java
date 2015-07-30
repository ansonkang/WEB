package Hibernate.user;

/**
 * AbstractCus entity provides the base persistence definition of the Cus
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCus implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String psWord;

	// Constructors

	/** default constructor */
	public AbstractCus() {
	}

	/** minimal constructor */
	public AbstractCus(String name) {
		this.name = name;
	}

	/** full constructor */
	public AbstractCus(String name, String psWord) {
		this.name = name;
		this.psWord = psWord;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPsWord() {
		return this.psWord;
	}

	public void setPsWord(String psWord) {
		this.psWord = psWord;
	}

}