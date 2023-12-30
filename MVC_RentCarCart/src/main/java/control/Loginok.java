package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginOK.do")
public class Loginok extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   request.setCharacterEncoding("UTF-8");
	   
	   HttpSession session = request.getSession();
	   String rentlogin = (String)session.getAttribute("rentlogin");
	   
	   if(rentlogin != null && !rentlogin.isEmpty()) {
		   
		   RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=RentcarMain.jsp");
		   rdis.forward(request, response);
		   
	   }else {
		   request.setAttribute("LoginError", "로그인 후 사용하세요");
			RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
			rdis.forward(request, response);
	   }
	}
}
