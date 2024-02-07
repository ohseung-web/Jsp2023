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
import model.MemberDTO;

@WebServlet("/MyShop.do")
public class MyShop extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = ldao.getMemberByLoginId(loginId);
		
		request.setAttribute("mdto", mdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=MyShop.jsp");
		rd.forward(request, response);
	}
}
