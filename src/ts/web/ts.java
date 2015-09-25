package ts.web;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.person.Person;
import Hibernate.person.PersonDAO;

public class ts {
	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	static Person person;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	void myts() {
		// 获取所有的试题题目
		PersonDAO dao = new PersonDAO();
		List list = dao.findAll();
		for (int i = 0; i < list.size(); i++) {
			person = (Person) list.get(i);
			if (person.getNum().equals("500417")) {
				System.out.println(i + 1 + "------" + person.getName());
				break;
			}
		}

	}
}
