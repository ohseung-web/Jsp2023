package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LivingDAO;

@WebServlet("/MemberFindIdProc.do")
public class MemberFindIdProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		
		String check_method = request.getParameter("check_method");
		String name = request.getParameter("name");
		if(check_method.equals("email")) {
			String email = request.getParameter("email");
			ArrayList<String> idList = ldao.getIdListByEmail(name,email);
			if(idList.size() == 0) {
				request.setAttribute("msgError", "입력하신 정보로 가입된 회원 아이디는 존재하지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("MemberFindIdError.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("idList", idList);
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=MemberFindIdResult.jsp");
				rd.forward(request, response);
			}
		}else {
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1+"-"+phone2+"-"+phone3;
			ArrayList<String> idList = ldao.getIdListByPhone(name,phone);
			if(idList.size() == 0) {
				request.setAttribute("msgError", "입력하신 정보로 가입된 회원 아이디는 존재하지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("MemberFindIdError.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("idList", idList);
				request.setAttribute("name", name);
				request.setAttribute("phone", phone);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=MemberFindIdResult.jsp");
				rd.forward(request, response);
			}
		}
	}
}
