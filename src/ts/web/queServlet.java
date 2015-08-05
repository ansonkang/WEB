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
import Hibernate.queEntry.Queentry;

public class queServlet extends HttpServlet {

	/**
	 * �������ʵ�ִ��⹦�� 1.�Զ����⣨������ 2.����ҳ��ѡ�񣬼�¼�� 3.���ܴ����¼
	 */
	Session session = null;
	Transaction ts = null;
	QueDAO queDao = new QueDAO();
	Que que = new Que();
	Queentry queEntry = new Queentry();
	List list = null;
	List listEntry = null;
	String strAll = "";
	String strQue = "";
	String strQueEntry = "";
	String a[]=null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");

		session = HibernateSessionFactory.getSession();
		ts = session.beginTransaction();
		list = queDao.findAll();

		for (int i = 0; i < list.size(); i++) {
			que = (Que) list.get(i);
			listEntry = queDao.findEntryByQue(que);
			strQue = i + 1 + "." + que.getQueDesc();
			strQueEntry = "";
			for (int j = 0; j < listEntry.size(); j++) {
				queEntry = (Queentry) listEntry.get(j);
					if(j==0) {
						strQueEntry=queEntry.getDesc();
					}else{
						strQueEntry += "|"+ queEntry.getDesc();
					}

			}
			response.getWriter().write(getStr(strQue, strQueEntry,i));
		}

		ts.commit();
		session.close();

	}

	private String getStr(String strQue, String strQueEntry, int i) {
		// TODO Auto-generated method stub

		String str = "<h1>" + strQue + "</h1><div data-role=\"controlgroup\">";
		a=strQueEntry.split("\\|");
		for(int k=0;k<a.length;k++){
			str+="<label for=\"id"+i+k+"\">"+a[k]+"</label><input type=\"radio\" name=\"id"+i+k+"\" id=\"id"+i+k+"\" value=\"id"+i+k+"\">";
		}
		str+="</div>";
		// +
		// "<div data-role=\"controlgroup\"><label for=\"red\">��ɫ</label><input type=\"radio\" name=\"favcolor\" id=\"red\" value=\"red\">"
		// +
		// "<label for=\"green\">��ɫ</label><input type=\"radio\" name=\"favcolor\" id=\"green\" value=\"green\"><label for=\"blue\">��ɫ</label>"
		// +
		// "<input type=\"radio\" name=\"favcolor\" id=\"blue\" value=\"blue\"></div>";
		System.out.println(str);
		return str;
		
	}
}
