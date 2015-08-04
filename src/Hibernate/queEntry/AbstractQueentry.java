package Hibernate.queEntry;

/**
 * AbstractQueentry entity provides the base persistence definition of the
 * Queentry entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractQueentry implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer parentId;
	private String desc;

	// Constructors

	/** default constructor */
	public AbstractQueentry() {
	}

	/** full constructor */
	public AbstractQueentry(Integer parentId, String desc) {
		this.parentId = parentId;
		this.desc = desc;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}