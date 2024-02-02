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
		
		if(id.equals("-1")) { // 로그아웃 
			session.setAttribute("id", null); // 세션에 저장된 아이디 null값으로 바꾸기
			session.setAttribute("cartcnt", null);
			RequestDispatcher dis = request.getRequestDispatcher("MainList.do"); 
			dis.forward(request, response);
		}else {
			if(pw.equals(getpw)) { // 로그인 성공
				session.setAttribute("id", id); // 세션에 로그인한 아이디 저장
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do"); 
				dis.forward(request, response);
			}else { // 로그인 실패
				request.setAttribute("loginfail", "아이디와 비밀번호를 확인해주세요");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
				dis.forward(request, response);
			}
		}
	}
	
}