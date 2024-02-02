package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/MainList.do")
public class MainList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TeteumDAO tdao = new TeteumDAO();
		ArrayList<TeteumDTO> list = tdao.getAllProduct(); // ��� ��ǰ �������� �޼ҵ�
		
		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		if(id!=null) {
			int cartcnt = tdao.getCountCart(id); // �α����� id�� ��ٱ��� ���� �������� �޼ҵ�
			session.setAttribute("cartcnt", cartcnt);
		}else {
			session.setAttribute("cartcnt", null);
		}
		
		String section = request.getParameter("section");
		if(section != null) {
			request.setAttribute("section", section);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("Main.jsp");
		dis.forward(request, response);
		
	}

}
