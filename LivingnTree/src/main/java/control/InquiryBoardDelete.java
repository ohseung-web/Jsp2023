package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InquiryDTO;
import model.LivingDAO;

@WebServlet("/InquiryBoardDelete.do")
public class InquiryBoardDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		
		LivingDAO ldao = new LivingDAO();
		InquiryDTO idto = ldao.getOneUpdateInquiryBoard(code);
		
		request.setAttribute("idto", idto);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=InquiryBoardDelete.jsp");
		rd.forward(request, response);
	}
}