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

@WebServlet("/GetOneBoard.do")
public class GetOneBoardProc extends HttpServlet {
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
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");
		PaulDTO pdto = bdao.getOneBoard(b_no);
		request.setAttribute("b_no",pdto.getB_no());
		request.setAttribute("b_subject",pdto.getB_subject());
		request.setAttribute("u_id",pdto.getU_id());
		request.setAttribute("b_date",pdto.getB_date().substring(0, 16));
		request.setAttribute("b_contents",pdto.getB_contents());
		if(log != null && !log.isEmpty()) {
			if(log.equals(bdao.getOneId(b_no))) {
				RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=OneBoard.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("BoardNo", "다른 사람의 게시물에 접근할 수 없습니다.");
				RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
				dis.forward(request, response);
			}
		}else {
			request.setAttribute("BoardLogin", "로그인 후 이용 가능합니다.");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
	}
}
