package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;

@WebServlet("/CartSelectDel.do")

public class CartSelectDelProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] itemlist = request.getParameterValues("item");
		CartDAO cdao = new CartDAO();
		for(int i = 0; i < itemlist.length; i++) {
			int no = Integer.parseInt(itemlist[i]);
			cdao.deleteCart(no);
		}
		request.setAttribute("msg", "del");
		RequestDispatcher dis = request.getRequestDispatcher("CartAlert.jsp");
		dis.forward(request, response);
	}
}
