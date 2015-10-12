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
	List list;
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
		// 参数传入
		response.setContentType("text/html;charset=utf-8");
		String str = request.getParameter("msg");

		response.getWriter().write(msgByNum(str));
	}

	String msgByNum(String msg) {
		// 输入工号返回信息
		PersonDAO dao = new PersonDAO();
		String str = "";

		if (msg.length() == 6)// 输入的是工号
		{
			list = dao.findByNum(msg);
		} else if (msg.subSequence(0, 1).equals("*"))
		// 模糊查询名称
		{
			msg = msg.replace("*", "");
			System.out.println(msg);
			list = dao.findLikeName(msg);
		} else
		// 输入的是名称
		{
			list = dao.findByName(msg);
		}
		System.out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			person = (Person) list.get(i);
			str += person.getNum() + ";" + person.getName() + ";"
					+ person.getDateE() + ";" + "<br/>";
		}
		System.out.println(str);
		return str;
	}
}
