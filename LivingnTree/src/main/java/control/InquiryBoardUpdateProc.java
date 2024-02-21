package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;

@WebServlet("/InquiryBoardUpdateProc.do")
public class InquiryBoardUpdateProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		LivingDAO ldao = new LivingDAO();
		ldao.updateInquiryBoard(code, subject, content);
			
		RequestDispatcher rd = request.getRequestDispatcher("InquiryBoardList.do");
		rd.forward(request, response);
	}
}