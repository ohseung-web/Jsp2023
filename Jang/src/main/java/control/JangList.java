package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.jangDAO;
import model.jangDTO;
import model.productDAO;
import model.productDTO;

/**
 * Servlet implementation class JangList
 */
@WebServlet("/JangList.do")
public class JangList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JangList(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   JangList(request, response);
	}
	protected void JangList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		jangDAO jdao = new jangDAO();
		jangDTO jdto = new jangDTO();
		ArrayList<jangDTO> a = new ArrayList<jangDTO>();
		 a = jdao.list();
        
		request.setAttribute("a", a);
	     RequestDispatcher dis = request.getRequestDispatcher("jangform.jsp");
				dis.forward(request, response);
		
		
	}

}
