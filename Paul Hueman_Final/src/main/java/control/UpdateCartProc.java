package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;

@WebServlet("/updateCart.do")
public class UpdateCartProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		int cnt= Integer.parseInt(request.getParameter("cnt"));
		
		CartDAO cdao = new CartDAO();
		cdao.updateCart(cnt, no);
		request.setAttribute("msg", "udt");
		RequestDispatcher dis = request.getRequestDispatcher("CartAlert.jsp");
		dis.forward(request, response);
	}
}
