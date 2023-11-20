package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PaulDAO;

@WebServlet("/LeaveUser.do")
public class LeaveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String paul_login = (String)session.getAttribute("paul_login");
		
		//雀盔呕硼
		PaulDAO pdao = new PaulDAO();
		pdao.leaveUser(paul_login);
		
		session.invalidate(); //历厘等 技记 傈何 昏力
		
		RequestDispatcher dis = request.getRequestDispatcher("LogoutProc.do");
		dis.forward(request, response);
	}

}
