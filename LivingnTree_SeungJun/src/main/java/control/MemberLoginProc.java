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

@WebServlet("/MemberLoginProc.do")
public class MemberLoginProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		if(userId != null && !userId.isEmpty() && userPw != null && !userPw.isEmpty()) {
			
			LivingDAO ldao = new LivingDAO();
			String dbPw = ldao.getMemberPw(userId);
			
			if(userPw.equals(dbPw)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("loginId", userId);
				session.setAttribute("loginPw", userPw);
//				오티 수정분
				session.setMaxInactiveInterval(60*5);
				
				RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
				rd.forward(request, response);
				
			}else {
				request.setAttribute("msgError", "아이디 또는 비밀번호가 일치하지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("MemberLoginError.jsp");
				rd.forward(request, response);
			}
		}
		
	}
}
