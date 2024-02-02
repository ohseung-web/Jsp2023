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
import model.TeteumDTO;

@WebServlet("/Boardwriterproc.do")
public class Boardwriterproc extends HttpServlet {

	
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
			request.setAttribute("loginessential", "로그인 후 이용 가능합니다.");
			
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			TeteumDTO tdto = new TeteumDTO();
			
			tdto.setB_type(request.getParameter("b_type"));
			tdto.setB_title(request.getParameter("b_title"));
			tdto.setId(id);
			tdto.setB_content(request.getParameter("b_content"));
			
			TeteumDAO tdao = new TeteumDAO();
			tdao.getInsert(tdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Board_list.do");
			dis.forward(request, response);
		}
		
	}
}