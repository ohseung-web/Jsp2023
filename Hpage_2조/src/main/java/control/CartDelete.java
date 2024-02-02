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

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/CartDelete.do")
public class CartDelete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		String no = request.getParameter("c_no");
		
		TeteumDAO tdao = new TeteumDAO();
		
		tdao.deleteCart(no);
		
		ArrayList<TeteumDTO> al = tdao.getAllCart(id);
		
		TeteumDTO tdto = tdao.getSumCart(id);
		
		request.setAttribute("al", al);
		request.setAttribute("sum_price", tdto.getC_price());
		
		RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=AllCart.jsp");
		dis.forward(request, response);
		
	}

}
