package ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.type.Type;
import Hibernate.type.TypeDAO;
import Hibernate.typeentry.Typeentry;
import Hibernate.typeentry.TypeentryDAO;

public class typeServlet extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	String strType = null;
	TypeDAO typeDao = new TypeDAO();
	TypeentryDAO typeEDao = new TypeentryDAO();
	Type type = null;
	Typeentry typeEntry = null;
	List ltType = null;
	List ltTypeEntry = null;
	Element root = null;
	Element ele = null;
	String[] types = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		strType = request.getParameter("type");
		if (request.getParameter("typeM") != null)
			strType += "|" + request.getParameter("typeM");
		if (request.getParameter("typeL") != null) {
			strType += "|" + request.getParameter("typeL");
		}

		// 刷新是汇总所有类别，将类别分批显示出来
		response.getWriter().write(load(strType));
	}

	private String load(String str) {
		// 刷新是汇总所有类别，将类别分批显示出来
		Document doc = DocumentHelper.createDocument();
		root = doc.addElement("div");

		if (str.equals("load")) {
			// 获取所有类别 ，根据类别增加按钮
			ltType = typeDao.findAll();
			for (int i = 0; i < ltType.size(); i++) {
				type = (Type) ltType.get(i);
				ltTypeEntry = typeEDao.findByParentId(type.getId());
				ele = root.addElement("button");
				ele.setText(type.getName());
				// 修改布局
				ele.addAttribute("class", "ui-grid-c");
				ele.addAttribute("name", type.getName());
				ele.addAttribute("data-role", "fieldcontain");

				ele.addAttribute("data-icon", "arrow-r");
				ele.addAttribute("data-inline", "true");

				for (int j = 0; j < ltTypeEntry.size(); j++) {
					typeEntry = (Typeentry) ltTypeEntry.get(j);
					str = typeEntry.getName();
				}
			}

		} else if (strType.substring(0, 3).equals("add")) {
			// 新增基础资料
			System.out.println(strType);
			types = strType.split("\\|");
			System.out.println(types[2]);

			Typeentry typeEntry2 = new Typeentry();
			typeEntry2.setName(types[2]);
			ltType = typeDao.findByName(types[1]);
			type = (Type) ltType.get(0);
			typeEntry2.setParentId(type.getId());
			// 此处多次新建session、transaction是否可以优化？
			Session session = HibernateSessionFactory.getSession();
			Transaction ts = session.getTransaction();
			ts.begin();
			session.save(typeEntry2);
			ts.commit();
		} else if (strType.substring(0, 6).equals("select")) {
			// 根据收入的类别名称，更新基础数据
			types = strType.split("\\|");

			ltType = typeDao.findByName(types[1]);
			for (int i = 0; i < ltType.size(); i++) {
				type = (Type) ltType.get(i);
				ltTypeEntry = typeEDao.findByParentId(type.getId());

				for (int j = 0; j < ltTypeEntry.size(); j++) {
					typeEntry = (Typeentry) ltTypeEntry.get(j);
					ele = root.addElement("p");
					ele.setAttributeValue("id", typeEntry.getId().toString());
					ele.setText(j + 1 + " ." + typeEntry.getName());
				}
			}
		} else if (strType.substring(0, 6).equals("delete")) {
			// 此处多次新建session、transaction是否可以优化？
			types = strType.split("\\|");
			typeEntry = typeEDao.findById(types[1]);
			Session session = HibernateSessionFactory.getSession();
			Transaction ts = session.getTransaction();
			ts.begin();
			session.delete(typeEntry);
			ts.commit();
			session.close();
		}
		return doc.getRootElement().asXML();

	}
}
