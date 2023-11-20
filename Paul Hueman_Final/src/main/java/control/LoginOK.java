package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginOK.do")
public class LoginOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	//MY PAGE���� �������� ù ȭ��
	//�α��λ����� ��츸 �������̵� ����
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String paul_login = (String)session.getAttribute("paul_login");
		
		//�α��� ������ ��� Ȯ�� ����
		if(paul_login != null && !paul_login.isEmpty()) { // �α��� ����

			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=UserModifyLogin.jsp");
			dis.forward(request, response);
			
		}else {//�α׾ƿ� ����
			request.setAttribute("LoginError", "�α��� �� �̿밡��!");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		
	}

}