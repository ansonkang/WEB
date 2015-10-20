package ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.sales.Sales;
import Hibernate.sales.SalesDAO;

public class reportSer extends HttpServlet {

	/**
	 * 
	 */
	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	Sales sales = null;
	List list = null;
	String str = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		// SalesDAO dao = new SalesDAO();
		SalesDAO dao = new SalesDAO();
		list = dao.findAll();
		for (int i = 0; i < list.size(); i++) {
			sales = (Sales) list.get(i);
			System.out.println(sales.getAmount());
		}
		response.getWriter().write("20|10|25|20|10|20|10");
	}

}
