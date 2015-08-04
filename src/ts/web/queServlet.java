package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.que.Que;
import Hibernate.que.QueDAO;

public class queServlet extends HttpServlet {

	/**
	 * 这边用来实现答题功能 1.自动出题（题数） 2.根据页面选择，记录答案 3.汇总答题记录
	 */
	Session session = null;
	Transaction ts = null;
	QueDAO queDao = new QueDAO();
	Que que = new Que();
	List list = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");

		session = HibernateSessionFactory.getSession();
		ts = session.beginTransaction();
		que = (Que) queDao.findByQueNum("A1");
		System.out.println(que);
		list = (List) queDao.findById(2);
		ts.commit();
		session.close();
		System.out.println(list.toString());
		response.getWriter().write(list.toString());
	}

}
