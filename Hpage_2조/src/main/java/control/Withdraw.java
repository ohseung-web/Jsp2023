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

@WebServlet("/Withdraw.do")
public class Withdraw extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			request.setAttribute("loginessential", "�α��� �� �̿� �����մϴ�.");
			
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			String passwd = request.getParameter("password");
			
			TeteumDAO tdao = new TeteumDAO();
			
			String pw = tdao.getPw(id);
			
			if(pw.equals(passwd)) {
				
				tdao.deleteMember(id);
				
				session.setAttribute("id", null);
				session.setAttribute("cartcnt", null);
				
				request.setAttribute("withdrawsuccess", "Ż�� �Ϸ�Ǿ����ϴ�.");
				
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}else {
				request.setAttribute("withdrawfail", "���� ��й�ȣ�� Ȯ���ϼ���.");
				
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
			}
			
		}
	}

}
