package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;

@WebServlet("/FindId.do")
public class FindId extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name"); // ���̵� ã�⿡�� �Է��� �̸�
		String email = request.getParameter("email"); // ���̵� ã�⿡�� �Է��� �̸���
		
		TeteumDAO tdao = new TeteumDAO();
		
		String findid = tdao.findId(name, email); // ã�� ���̵�
		 
		if(findid != "") { // ���̵� �����ϸ�
			request.setAttribute("findid", findid);
			request.setAttribute("section", "FindSuccess.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp"); 
			dis.forward(request, response);
		}else {
			request.setAttribute("findidfail", "�������� �ʴ� ȸ�������Դϴ�");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}
		
		
		
	}

}
