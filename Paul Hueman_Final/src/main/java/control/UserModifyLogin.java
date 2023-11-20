package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaulDAO;

@WebServlet("/UserModifyLogin.do")
public class UserModifyLogin extends HttpServlet {
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
		
		//UserModifyLogin.jsp ����  u_id, u_pw ���� �޾ƿ��� ���
		if((u_id != null && !u_id.isEmpty()) && (pw != null && !pw.isEmpty())) {

			PaulDAO pdao = new PaulDAO();
			String u_pw = pdao.getpw(u_id);
			
			//u_id�� �����ϴ� db�� u_pw�� �Է¹��� request.getParameter("u_pw")�� ���� ���� ���
			if(u_pw.equals(request.getParameter("u_pw"))) {
				
				//ȸ������ ���� �������� �� db���� �ޱ�
				RequestDispatcher dis = request.getRequestDispatcher("GetUserData.do");
				dis.forward(request, response);

			}else {
				request.setAttribute("UserModifyLoginError", "��й�ȣ�� Ʋ���ϴ�.");
				RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
				dis.forward(request, response);
			}
		}else { //Login.jsp ����  u_id, u_pw ���� �޾ƿ��� ������ ���
			request.setAttribute("UserModifyLoginError", "��й�ȣ�� �Է��ϼ���");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
	}

}
