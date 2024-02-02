package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeteumDAO;

@WebServlet("/Login.do")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		TeteumDAO tdao = new TeteumDAO();
		String getpw = tdao.getPw(id);
		
		if(id.equals("-1")) { // �α׾ƿ� 
			session.setAttribute("id", null); // ���ǿ� ����� ���̵� null������ �ٲٱ�
			session.setAttribute("cartcnt", null);
			RequestDispatcher dis = request.getRequestDispatcher("MainList.do"); 
			dis.forward(request, response);
		}else {
			if(pw.equals(getpw)) { // �α��� ����
				session.setAttribute("id", id); // ���ǿ� �α����� ���̵� ����
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do"); 
				dis.forward(request, response);
			}else { // �α��� ����
				request.setAttribute("loginfail", "���̵�� ��й�ȣ�� Ȯ�����ּ���");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
				dis.forward(request, response);
			}
		}
	}
	
}