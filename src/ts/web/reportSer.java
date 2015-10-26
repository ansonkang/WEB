package ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.sales.SalesDAO;

public class reportSer extends HttpServlet {

	/**
	 * 
	 */
	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	SalesDAO dao = new SalesDAO();
	List list = null;
	String str = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");

		// 返回最近7天业绩
		list = dao.findAll(7);

		JSONArray json = JSONArray.fromObject(list);
		response.getWriter().write(json.toString());
	}

}
