package Hibernate.que;

/**
 * AbstractQue entity provides the base persistence definition of the Que
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractQue implements java.io.Serializable {

	// Fields

	private Integer id;
	private String queNum;
	private String queDesc;
	private String answer;

	// Constructors

	/** default constructor */
	public AbstractQue() {
	}

	/** full constructor */
	public AbstractQue(String queNum, String queDesc, String answer) {
		this.queNum = queNum;
		this.queDesc = queDesc;
		this.answer = answer;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQueNum() {
		return this.queNum;
	}

	public void setQueNum(String queNum) {
		this.queNum = queNum;
	}

	public String getQueDesc() {
		return this.queDesc;
	}

	public void setQueDesc(String queDesc) {
		this.queDesc = queDesc;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}