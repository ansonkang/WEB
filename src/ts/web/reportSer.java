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

	static void main(String[] args) {

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");

		String strDay = request.getParameter("day");
		// 返回最近7天业绩
		list = dao.findAll(Integer.parseInt(strDay));
		// 转换为json传至页面
		JSONArray json = JSONArray.fromObject(list);
		response.getWriter().write(json.toString());
	}
	// void proc(){
	// Query q=session.createSQLQuery("{call proc2(?,?)}");
	// CallableStatement cs = session.connection().prepareCall("{proc2(?,?)}");
	// cs.setString(1,"23");
	// cs.registerOutParameter(2, Types.INTEGER);
	// }

}
