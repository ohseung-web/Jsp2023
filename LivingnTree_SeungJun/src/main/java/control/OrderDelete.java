package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;

@WebServlet("/OrderDelete.do")
public class OrderDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LivingDAO ldao = new LivingDAO();
		String date = request.getParameter("date");
		int code = Integer.parseInt(request.getParameter("code"));
		
		/*
		 * HttpSession session = request.getSession(); String loginId =
		 * (String)session.getAttribute("loginId");
		 */
		
		ldao.deleteOrders(date, code);
		ldao.deleteDelivaddress(date, code);
		
		RequestDispatcher rd = request.getRequestDispatcher("MyShopOrder.do");
		rd.forward(request, response);
	}
}