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
public class LoginOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	//MY PAGE에서 보여지는 첫 화면
	//로그인상태일 경우만 페이지이동 가능
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String paul_login = (String)session.getAttribute("paul_login");
		
		//로그인 상태일 경우 확인 가능
		if(paul_login != null && !paul_login.isEmpty()) { // 로그인 상태

			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp?section=UserModifyLogin.jsp");
			dis.forward(request, response);
			
		}else {//로그아웃 상태
			request.setAttribute("LoginError", "로그인 후 이용가능!");
			RequestDispatcher dis = request.getRequestDispatcher("Error.jsp");
			dis.forward(request, response);
		}
		
	}

}