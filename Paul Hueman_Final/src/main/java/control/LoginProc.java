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
		
		//Login.jsp ����  u_id, u_pw ���� �޾ƿ��� ���
		if((u_id != null && !u_id.isEmpty()) && (pw != null && !pw.isEmpty())) {

			PaulDAO pdao = new PaulDAO();
			String u_pw = pdao.getpw(u_id);
			
			//u_id�� �����ϴ� db�� u_pw�� �Է¹��� request.getParameter("u_pw")�� ���� ���� ���
			if(u_pw.equals(request.getParameter("u_pw"))) {
				HttpSession session = request.getSession();
				session.setAttribute("paul_login", u_id);

				RequestDispatcher dis = request.getRequestDispatcher("Main.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("LoginError", "���Ե� ȸ�����̵� �ƴϰų� ��й�ȣ�� Ʋ���ϴ�.");
				RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
				dis.forward(request, response);
			}
		}else { //Login.jsp ����  u_id, u_pw ���� �޾ƿ��� ������ ���
			request.setAttribute("LoginError", "���̵�, ��й�ȣ�� �Է��ϼ���");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
	}

}
