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

@WebServlet("/LoginProc.do")
public class LoginProc extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String u_id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		
		//Login.jsp 에서  u_id, u_pw 값을 받아왔을 경우
		if((u_id != null && !u_id.isEmpty()) && (pw != null && !pw.isEmpty())) {

			PaulDAO pdao = new PaulDAO();
			String u_pw = pdao.getpw(u_id);
			
			//u_id에 대응하는 db의 u_pw와 입력받은 request.getParameter("u_pw")의 값이 같은 경우
			if(u_pw.equals(request.getParameter("u_pw"))) {
				HttpSession session = request.getSession();
				session.setAttribute("paul_login", u_id);

				RequestDispatcher dis = request.getRequestDispatcher("Main.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("LoginError", "가입된 회원아이디가 아니거나 비밀번호가 틀립니다.");
				RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
				dis.forward(request, response);
			}
		}else { //Login.jsp 에서  u_id, u_pw 값을 받아오지 못했을 경우
			request.setAttribute("LoginError", "아이디, 비밀번호를 입력하세요");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
	}

}
