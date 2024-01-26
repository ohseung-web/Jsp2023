package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RentDAO;


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
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
	
		//예외처리
		/*
		 * if(userId == null) { // 로그인 되지 않은 상태에 id를 geust로 저장한다.
		 * session.setAttribute("rentlogin", "geust"); RequestDispatcher rdis =
		 * request.getRequestDispatcher("RentcarMain.jsp"); rdis.forward(request,
		 * response);
		 * 
		 * }else
		 */ 
		
		  if((userId != null && !userId.isEmpty()) && (userPw != null && !userPw.isEmpty())) {
			
			RentDAO rdao = new RentDAO();
			String dbPw = rdao.getMemberPw(userId);
			
			// id와 pw가 일치하는지 예외처리
			if(dbPw.equals(userPw)) {
				
				// servlet에서 session을 지정하는 방식
				//HttpSession session = request.getSession();
				session.setAttribute("rentlogin", userId);
				session.setMaxInactiveInterval(60*5);//5분동안 로그인 상태 유지 함
				
				RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp");
				rdis.forward(request, response);
				
			}else {
				request.setAttribute("LoginError", "아이디와 패스워드를 확인하세요");
				RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
				rdis.forward(request, response);
			}
			
		} else {
			request.setAttribute("LoginError", "아이디와 패스워드를 입력하세요");
			RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
			rdis.forward(request, response);
		}
		
	}
}


