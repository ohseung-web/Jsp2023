package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;

@WebServlet("/ReviewBoardDeleteProc.do")
public class ReviewBoardDeleteProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		int code = Integer.parseInt(request.getParameter("code"));
		String userPw = request.getParameter("userPw");
		String dbPw = request.getParameter("dbPw");
		
		if(userPw.equals(dbPw) || loginId.equals("admin")) {
			LivingDAO ldao = new LivingDAO();
			ldao.deleteReviewBoard(code);
			
			request.setAttribute("msg", "1");
			RequestDispatcher rd = request.getRequestDispatcher("ReviewBoardList.do");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("msg", "0");
			RequestDispatcher rd = request.getRequestDispatcher("ReviewBoardList.do");
			rd.forward(request, response);
		}
	}
}
