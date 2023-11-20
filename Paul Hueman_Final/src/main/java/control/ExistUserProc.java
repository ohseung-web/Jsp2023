package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDAO;

@WebServlet("/ExistUserProc.do")
public class ExistUserProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 중복확인
		request.setCharacterEncoding("UTF-8");
		
		String u_id = request.getParameter("u_id");
	
		PaulDAO pdao = new PaulDAO();
		String notjoin = pdao.existUser(u_id);
		
		String okjoin ="";
		if(notjoin.equals("")) {
			okjoin = "사용가능한 아이디 입니다.";
			
			request.setAttribute("notjoin", null);
			request.setAttribute("okjoin", okjoin);
			request.setAttribute("u_id", u_id);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Join.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("notjoin", notjoin);
			request.setAttribute("okjoin", null);
			request.setAttribute("u_id", u_id);
			
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=Join.jsp");
			dis.forward(request, response);
		}
	}

}
