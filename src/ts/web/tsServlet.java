package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.user.Cus;
import Hibernate.user.CusDAO;

public class tsServlet extends HttpServlet {

	/**
	 * 
	 */
	Session session = null;
	Transaction ts = null;
	CusDAO cusDao = new CusDAO();
	Cus cus = new Cus();
	List list = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		// 新注册用户
		if (type.equals("new")) {
			if (cusDao.findByName(username).size() != 0) {
				response.getWriter().write("用户名重复");
			} else {
				cus.setName(username);
				cus.setPsWord(password);
				session = HibernateSessionFactory.getSession();
				ts = session.beginTransaction();
				cusDao.save(cus);
				ts.commit();
				session.close();
				response.getWriter().write("保存成功");
			}
			// 登录
		} else if (type.equals("up")) {
			if (cusDao.findByName(username).size() == 0) {
				response.getWriter().write("nona");
			} else if (cusDao.findByName(username).size() != 0) {
				list = cusDao.findByName(username);
				cus = (Cus) list.get(0);
				// 密码错误
				if (!cus.getPsWord().equals(password)) {
					response.getWriter().write("error");
				} else if (cus.getPsWord().equals(password)) {
					response.getWriter().write("ok");
				}

			}
		}

	}
}
