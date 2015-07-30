package ts.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionBuilder;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Hibernate.HibernateSessionFactory;
import Hibernate.user.Cus;
import Hibernate.user.CusDAO;

public class tsServlet extends HttpServlet {

	/**
	 * 
	 */
	Session session=null;
	Transaction ts=null;
	CusDAO cusDao=new CusDAO();
	Cus cus=new Cus();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(cusDao.findByName(username).size()!=0)
        	{
        	response.getWriter().write("用户名重复");
        	}
        else{
	        cus.setName(username);
	        cus.setPsWord(password);
	        session=HibernateSessionFactory.getSession();
	    	ts=session.beginTransaction();
//	        ts.begin();
	        cusDao.save(cus);
	        ts.commit();
	        session.close();
	        System.out.println("保存成功");
	        response.getWriter().write("保存成功");
	        }
	}

}
