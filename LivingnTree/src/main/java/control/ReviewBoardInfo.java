package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;
import model.ReviewDTO;

@WebServlet("/ReviewBoardInfo.do")
public class ReviewBoardInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LivingDAO ldao = new LivingDAO();
		ReviewDTO rdto = new ReviewDTO();
		
		int code = Integer.parseInt(request.getParameter("code"));
		rdto = ldao.getOneReviewBoard(code);
		
		request.setAttribute("rdto", rdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=ReviewBoardInfo.jsp");
		rd.forward(request, response);
	}
}