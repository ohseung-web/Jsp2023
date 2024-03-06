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

@WebServlet("/InquiryBoardInfo.do")
public class InquiryBoardInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LivingDAO ldao = new LivingDAO();
		InquiryDTO idto = new InquiryDTO();
		
		int code = Integer.parseInt(request.getParameter("code"));
		idto = ldao.getOneInquiryBoard(code);
		
		request.setAttribute("idto", idto);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=InquiryBoardInfo.jsp");
		rd.forward(request, response);
	}
}