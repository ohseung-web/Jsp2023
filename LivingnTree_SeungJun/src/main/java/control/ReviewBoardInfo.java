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
		
		
//		request.setAttribute("num", rdto.getNum());
//		request.setAttribute("writer", rdto.getWriter());
//		request.setAttribute("email", rdto.getEmail());
//		request.setAttribute("subject", rdto.getSubject());
//		request.setAttribute("reg_date", rdto.getReg_date());
//		request.setAttribute("ref", rdto.getRef());
//		request.setAttribute("re_step", rdto.getRe_step());
//		request.setAttribute("re_level", rdto.getRe_level());
//		request.setAttribute("readcount", rdto.getReadcount());
//		request.setAttribute("content", rdto.getContent());
		
		request.setAttribute("rdto", rdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=ReviewBoardInfo.jsp");
		rd.forward(request, response);
	}
}