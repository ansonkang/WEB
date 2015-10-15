package ts.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reportSer extends HttpServlet {

	/**
	 * 
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String str = request.getParameter("ts");
		// JSONObject.fromObject(str);
		System.out.println("-------------" + request.getParameter("ts"));
		response.getWriter().write("[1,1],[2,1],[3,1],[4,1],[5,1],[6,1],[7,1]");
	}

}
