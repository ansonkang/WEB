package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
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
import Hibernate.que.Que;
import Hibernate.que.QueDAO;
import Hibernate.queEntry.Queentry;
import Hibernate.queEntry.QueentryDAO;

public class queServlet extends HttpServlet {

	/**
	 * 这边用来实现答题功能 1.自动出题（题数） 2.根据页面选择，记录答案 3.汇总答题记录
	 */
	Session session = null;
	Transaction ts = null;
	QueDAO queDao = new QueDAO();
	QueentryDAO queEntryDao = new QueentryDAO();
	Que que = new Que();
	Queentry queEntry = new Queentry();
	List list = null;
	List listEntry = null;
	String strAll = "";
	String strQue = "";
	String strQueEntry = "";
	String a[] = null;
	String aS[] = null;
	Element eleLab = null;
	Element eleInput = null;
	String str = "";
	String strAnswer = "";
	Document doc = null;
	Element ele = null;
	Element root = null;
	Element eleDiv = null;
	Element eleH1 = null;
	char charL = 'A';
	Collection queEntrys = new HashSet();

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 参数传入
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		// 通过type判断 为go 更新试题卷面
		if (type.equals("go")) {
			session = HibernateSessionFactory.getSession();
			ts = session.beginTransaction();
			// 获取所有的试题题目
			list = queDao.findAll();
			// 循环试题题目，获取所有的试题明细
			for (int i = 0; i < list.size(); i++) {
				que = (Que) list.get(i);
				listEntry = queDao.findEntryByQue(que);
				queEntrys.clear();
				for (int j = 0; j < listEntry.size(); j++) {
					queEntry = (Queentry) listEntry.get(j);

					queEntrys.add(queEntry);

				}
				// 将试题题目和明细，逐个传入网页
				response.getWriter().write(getStr(que, queEntrys, i));
			}

			ts.commit();
			session.close();
		} else if (type.equals("answer")) {
			// 提交答案，判断是否正确并反馈
			strAnswer = request.getParameter("answer");
			System.out.println(checkAnwer(strAnswer));
			response.getWriter().write(checkAnwer(strAnswer));
		}

	}

	private String checkAnwer(String strAn) {
		// TODO Auto-generated method stub
		a = strAn.split(";");
		// 拼接XML 3列
		doc = DocumentHelper.createDocument();
		root = doc.addElement("table");
		root.addAttribute("data-role", "table");
		root.addAttribute("data-mode", "columntoggle");
		root.addAttribute("class", "ui-body-c ui-responsive");
		ele = root.addElement("thead");
		ele = ele.addElement("tr");
		ele.addAttribute("class", "ui-bar-c");
		// 列标题
		ele.addElement("th").setText("题目");
		eleH1 = ele.addElement("th");
		eleH1.setText("选择");
		eleH1.setAttributeValue("data-priority", "1");
		eleH1 = ele.addElement("th");
		eleH1.setText("正确答案");
		eleH1.setAttributeValue("data-priority", "1");
		ele = root.addElement("tbody");
		// 增加信息行
		for (String strA : a) {
			aS = strA.split("\\|");// 注意 “|”的转义
			ele = ele.addElement("tr");
			que = queDao.findBystrId(aS[0]);// 题目
			queEntry = queEntryDao.findBystrId(aS[1]);// 选择
			// 判断回答是否正确
			// if (queEntry.getId().equals(que.getAnswer())) {
			System.out.println("ok");
			ele.addElement("td").setText(que.getQueDesc());
			ele.addElement("td").setText(queEntry.getDesc());
			ele.addElement("td").setText(
					queEntryDao.findBystrId(que.getAnswer()).getDesc());
			// } else {
			// System.out.println("error");
			// }

		}
		return doc.getRootElement().asXML();
	}

	@SuppressWarnings("deprecation")
	private String getStr(Que que, Collection queEntrys, int i) {
		// 拼接XML样式，逐个拼接
		// 拼接标题
		doc = DocumentHelper.createDocument();
		root = doc.addElement("div");
		root.setAttributeValue("value", que.getId().toString());
		eleH1 = root.addElement("h1");
		eleH1.setText(i + 1 + ". " + que.getQueDesc().toString());
		eleH1.setAttributeValue("value", que.getId().toString());
		// 拼接明细
		eleDiv = root.addElement("div");
		eleDiv.addAttribute("data-role", "controlgroup");
		int k = 0;
		for (Iterator iter = queEntrys.iterator(); iter.hasNext(); k++) {
			queEntry = (Queentry) iter.next();
			str = que.getId() + "|" + queEntry.getId();
			eleLab = eleDiv.addElement("label");
			eleLab.setText(String.valueOf((char) (charL + k)) + "."
					+ queEntry.getDesc());
			eleLab.addAttribute("for", str);
			eleInput = eleDiv.addElement("input");
			eleInput.addAttribute("id", str);
			eleInput.addAttribute("type", "radio");
			eleInput.addAttribute("name", "put" + i);
			eleInput.addAttribute("value", queEntry.getId().toString());
		}
		return doc.getRootElement().asXML();
	}
}
