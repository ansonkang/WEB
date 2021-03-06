package ts.web;

import java.io.IOException;
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
	 * 登录页面 index.jsp
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
		// 获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		// 根据type判断注册OR登录
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
			// 查询是够有该用户
			if (cusDao.findByName(username).size() == 0) {
				response.getWriter().write("无此用户，请核实用户名！");
			} else if (cusDao.findByName(username).size() != 0) {
				list = cusDao.findByName(username);
				cus = (Cus) list.get(0);
				// 密码错误
				if (!cus.getPsWord().equals(password)) {
					response.getWriter().write("你的账号或密码有误！");
				} else if (cus.getPsWord().equals(password)) {
					response.getWriter().write("ok");
				}

			}
		}

	}
}
