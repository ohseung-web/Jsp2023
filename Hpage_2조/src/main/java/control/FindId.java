package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;

@WebServlet("/FindId.do")
public class FindId extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name"); // 아이디 찾기에서 입력한 이름
		String email = request.getParameter("email"); // 아이디 찾기에서 입력한 이메일
		
		TeteumDAO tdao = new TeteumDAO();
		
		String findid = tdao.findId(name, email); // 찾은 아이디
		 
		if(findid != "") { // 아이디가 존재하면
			request.setAttribute("findid", findid);
			request.setAttribute("section", "FindSuccess.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp"); 
			dis.forward(request, response);
		}else {
			request.setAttribute("findidfail", "존재하지 않는 회원정보입니다");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}
		
		
		
	}

}
