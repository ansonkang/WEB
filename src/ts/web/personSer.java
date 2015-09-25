package ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.person.Person;
import Hibernate.person.PersonDAO;

/**
 * Servlet implementation class personSer
 */
@WebServlet("/personSer")
public class personSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	Person person;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ��������
		response.setContentType("text/html;charset=utf-8");
		String str = request.getParameter("msg");
		response.getWriter().write(msg(str));
	}

	String msg(String msg) {
		// ���빤�ŷ�����Ϣ
		PersonDAO dao = new PersonDAO();
		List list = dao.findAll();
		String str = "���޴��ˣ�";
		for (int i = 0; i < list.size(); i++) {
			person = (Person) list.get(i);
			if (person.getNum().equals(msg)) {
				str = person.getName() + ";����:" + person.getNum() + ";״̬��"
						+ person.getState();
				break;
			}
		}
		System.out.println(str);
		return str;
	}
}
