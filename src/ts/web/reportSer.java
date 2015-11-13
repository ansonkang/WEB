package ts.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import Hibernate.sales_brand.SalesBrandDAO;

public class reportSer extends HttpServlet {

	/**
	 * 
	 */
	Session session = HibernateSessionFactory.getSession();
	Transaction ts = session.beginTransaction();
	SalesDAO dao = new SalesDAO();
	SalesBrandDAO brandDao = new SalesBrandDAO();
	List list = null;
	String str = null;

	static void main(String[] args) {
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String strDay = request.getParameter("day");
		String strType = request.getParameter("type");

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String strDate = df.format(cal.getTime());

		System.out.println(strDate);
		// 返回最近7天业绩
		if ("bar".equals(strType))
			list = dao.findAll(Integer.parseInt(strDay));
		// 获取最后一天品牌业绩
		if ("pie".equals(strType)) {
			list = brandDao.findByDate(strDate, 5);
		}

		// 转换为json传至页面
		JSONArray json = JSONArray.fromObject(list);
		response.getWriter().write(json.toString());
	}

}
