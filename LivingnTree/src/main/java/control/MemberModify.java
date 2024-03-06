package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LivingDAO;
import model.MemberDTO;

@WebServlet("/MemberModify.do")
public class MemberModify extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		LivingDAO ldao = new LivingDAO();
		MemberDTO mdto = new MemberDTO();
		
		mdto = ldao.getOneMember(loginId);
		// String phone1 = mdto.getM_phone().substring(0, 3);
		String phone2 = mdto.getM_phone().substring(4, 8);
		String phone3 = mdto.getM_phone().substring(9, 13);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=MemberModify.jsp");
		rd.forward(request, response);
	}

}
