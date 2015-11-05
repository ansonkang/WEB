package ts.web;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.person.Person;

public class ts {
	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	static Person person;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
