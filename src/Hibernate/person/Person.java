package Hibernate.person;

import java.sql.Timestamp;

/**
 * Person entity. @author MyEclipse Persistence Tools
 */
public class Person extends AbstractPerson implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** full constructor */
	public Person(String num, String name, String state, Timestamp dateS,
			Timestamp dateE) {
		super(num, name, state, dateS, dateE);
	}

}
