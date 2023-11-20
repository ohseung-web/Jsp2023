package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;

@WebServlet("/DeleteBoard.do")
public class DeleteBoardProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bdao = new BoardDAO();
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String u_id=request.getParameter("u_id");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		if(log.equals(u_id)) {
			bdao.DeleteBoard(b_no);
			RequestDispatcher dis = request.getRequestDispatcher("BoardListProc.do");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("BoardListProc.do");
			dis.forward(request, response);
		}
		
	}
}
