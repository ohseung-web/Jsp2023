package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/GetOne.do")
public class GetOne extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String p_no = request.getParameter("p_no");
		
		TeteumDAO tdao = new TeteumDAO();
		TeteumDTO tdto = tdao.getOne(p_no);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("p_no", tdto.getP_no());
		session.setAttribute("p_name", tdto.getP_name());
		session.setAttribute("p_price", tdto.getP_price());
		session.setAttribute("p_colorone", tdto.getP_colorone());
		session.setAttribute("p_colortwo", tdto.getP_colortwo());
		session.setAttribute("p_img", tdto.getP_img());
		session.setAttribute("p_category", tdto.getP_category());
		
		RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Onelist.jsp");
		dis.forward(request, response);
		
	}

}
