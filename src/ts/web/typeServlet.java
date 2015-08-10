package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	Typeentry typeEntry = null;
	List types = null;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("123");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		strType = request.getParameter("type");
		System.out.println(strType + "================");

		types = typeEDao.findByParentId(typeDao.findByName("Àà±ð"));
		for (Object obj : types) {
			typeEntry = (Typeentry) obj;
			System.out.println(typeEntry.getName());
		}

	}

}
