package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

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

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		strType = request.getParameter("type");
		// 刷新是汇总所有类别，将类别分批显示出来
		response.getWriter().write(load(strType));
	}

	private String load(String str) {
		// 刷新是汇总所有类别，将类别分批显示出来
		Document doc = DocumentHelper.createDocument();
		root = doc.addElement("ul");

		if (str.equals("load")) {
			// 获取所有类别
			// data-role="button" data-icon="plus"
			ltType = typeDao.findAll();
			for (int i = 0; i < ltType.size(); i++) {
				type = (Type) ltType.get(i);
				ltTypeEntry = typeEDao.findByParentId(type.getId());
				ele = root.addElement("button");
				ele.setText(type.getName());
				ele.addAttribute("name", type.getName());

				ele.addAttribute("data-icon", "arrow-r");
				ele.addAttribute("data-inline", "true");

				for (int j = 0; j < ltTypeEntry.size(); j++) {
					typeEntry = (Typeentry) ltTypeEntry.get(j);
					str = typeEntry.getName();
				}
			}

		} else {
			// 根据收入的类别名称，更新基础数据
			ltType = typeDao.findByName(str);
			for (int i = 0; i < ltType.size(); i++) {
				type = (Type) ltType.get(i);
				ltTypeEntry = typeEDao.findByParentId(type.getId());

				for (int j = 0; j < ltTypeEntry.size(); j++) {
					typeEntry = (Typeentry) ltTypeEntry.get(j);
					ele = root.addElement("input");
					ele.setAttributeValue("value", typeEntry.getName());
					ele.setAttributeValue("readonly", "true");
				}
			}
		}
		return doc.getRootElement().asXML();

	}
}
