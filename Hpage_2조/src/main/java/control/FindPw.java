package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;

@WebServlet("/FindPw.do")
public class FindPw extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id"); // 아이디 찾기에서 입력한 아이디
		String email = request.getParameter("email"); // 아이디 찾기에서 입력한 이메일
		
		TeteumDAO tdao = new TeteumDAO();
		
		String findpw = tdao.findPw(id, email); // 찾은 비밀번호
		
		if(findpw != "") { // 비밀번호가 존재하면
			request.setAttribute("findpw", findpw);
			request.setAttribute("section", "FindSuccess.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Main.jsp"); 
			dis.forward(request, response);
		}else {
			System.out.println(findpw);
			request.setAttribute("findidfail", "존재하지 않는 회원정보입니다");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp"); 
			dis.forward(request, response);
		}
	}

}
