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

import model.CartDTO;
import model.LivingDAO;

@WebServlet("/CartUpdate.do")
public class CartUpdate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LivingDAO ldao = new LivingDAO();
		CartDTO cdto = new CartDTO();
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "guest";
		}
		
		//String btn = request.getParameter("btn");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int code = Integer.parseInt(request.getParameter("code"));
		
		ldao.updateCart2(cnt,code);
		
		int itemTotal = ldao.getItemTotal(loginId);
		int shippingTotal = ldao.getShippingTotal(loginId);
		request.setAttribute("itemTotal", itemTotal);
		request.setAttribute("shippingTotal", shippingTotal);
		
		ArrayList<CartDTO> cList = ldao.getAllCart(loginId);
		request.setAttribute("cList", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=CartList.jsp");
		rd.forward(request, response);
	}
}