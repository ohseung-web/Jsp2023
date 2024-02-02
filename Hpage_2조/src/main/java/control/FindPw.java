package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;

@WebServlet("/FindPw.do")
public class FindPw extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id"); // ���̵� ã�⿡�� �Է��� ���̵�
		String email = request.getParameter("email"); // ���̵� ã�⿡�� �Է��� �̸���
		
		TeteumDAO tdao = new TeteumDAO();
		
		String findpw = tdao.findPw(id, email); // ã�� ��й�ȣ
		
		if(findpw != "") { // ��й�ȣ�� �����ϸ�
			request.setAttribute("findpw", findpw);
			request.setAttribute("section", "FindSuccess.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp"); 
			dis.forward(request, response);
		}else {
			System.out.println(findpw);
			request.setAttribute("findidfail", "�������� �ʴ� ȸ�������Դϴ�");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}
	}

}
