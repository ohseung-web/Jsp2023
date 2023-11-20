package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

@WebServlet("/UpDateBoard.do")
public class UpDateBoardProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String b_subject = request.getParameter("bro")+request.getParameter("b_subject");
		String b_contents = request.getParameter("b_contents");
		b_contents = b_contents.replace("\r\n", "<br>");
		BoardDAO bdao = new BoardDAO();
		bdao.UpdateBoard(b_subject, b_contents, b_no);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardListProc.do");
		dis.forward(request, response);
	}
}
