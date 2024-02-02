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

@WebServlet("/AllCart.do")
public class AllCart extends HttpServlet {
	
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
		
		TeteumDAO tdao = new TeteumDAO();
		
		ArrayList<TeteumDTO> al = tdao.getAllCart(id);
		
		int count = tdao.getCountCart(id);
		
		TeteumDTO tdto = tdao.getSumCart(id);
		
		request.setAttribute("al", al);
		request.setAttribute("count", count);
		request.setAttribute("sum_price", tdto.getC_price());
		
		session.setAttribute("cartcnt", count);
		
		RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=AllCart.jsp");
		dis.forward(request, response);
		
	}

}
