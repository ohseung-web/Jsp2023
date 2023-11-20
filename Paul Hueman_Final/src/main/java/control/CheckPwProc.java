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
import model.PaulDAO;
import model.PaulDTO;


@WebServlet("/CheckPw.do")
public class CheckPwProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaulDAO pdao = new PaulDAO();
		BoardDAO bdao = new BoardDAO();
		PaulDTO pdto = new PaulDTO();
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		if(log != null && log.equals(id)) {
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=OneBoard.jsp");
			dis.forward(request, response);
		}else {
			if(pw.equals(pdao.getpw(id))) {
				pdto=bdao.getOneBoard(b_no);
				request.setAttribute("b_no",pdto.getB_no());
				request.setAttribute("b_subject",pdto.getB_subject());
				request.setAttribute("u_id",pdto.getU_id());
				request.setAttribute("b_date",pdto.getB_date());
				request.setAttribute("b_contents",pdto.getB_contents());
				RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=OneBoard.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("PwError", "비밀번호가 틀립니다.");
				RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
				dis.forward(request, response);
			}
		}
		
	}
}
