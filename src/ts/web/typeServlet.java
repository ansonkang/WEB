package ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("123");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		strType = request.getParameter("type");
		ltType=typeDao.findByName("Àà±ð");
		type=(Type) ltType.get(0);
		
		System.out.println(type.getId());
		ltTypeEntry=typeEDao.findByParentId(1);
		for(int i=0;i<ltTypeEntry.size();i++){
			typeEntry=(Typeentry) ltTypeEntry.get(i);
			System.out.println(typeEntry.getName());
		}
	}

}
