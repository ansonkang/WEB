package ts.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class queServlet extends HttpServlet {

	/**
	 * �������ʵ�ִ��⹦�� 1.�Զ����⣨������ 2.����ҳ��ѡ�񣬼�¼�� 3.���ܴ����¼
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		response.getWriter().write("����ɹ�");
	}

}
