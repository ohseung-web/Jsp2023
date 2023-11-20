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
import model.PaulDTO;


@WebServlet("/InsertBoardProc.do")
public class InsertBoardProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDAO bdao = new BoardDAO();
		PaulDTO pdto = new PaulDTO();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("paul_login");
		
		pdto.setB_subject(request.getParameter("bro")+request.getParameter("b_subject"));
		String ctt = request.getParameter("b_contents");
		ctt = ctt.replace("\r\n", "<br>");
		pdto.setB_contents(ctt);
		pdto.setU_id(id);
		bdao.InsertBoard(pdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListProc.do");
		dis.forward(request, response);
	}
}
