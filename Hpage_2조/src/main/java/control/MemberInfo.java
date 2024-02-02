package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeteumDAO;
import model.TeteumDTO;

@WebServlet("/MemberInfo.do")
public class MemberInfo extends HttpServlet {
	
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
			TeteumDAO tdao = new TeteumDAO();
			TeteumDTO tdto = tdao.getMemberInfo(id);
			
			request.setAttribute("tdto", tdto);
			
			ArrayList<TeteumDTO> al = tdao.getBoard(id);
			
			request.setAttribute("al", al);
			
			ArrayList<TeteumDTO> arl = tdao.getBuyProduct(id);
			
			request.setAttribute("arl", arl);
			
			RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=MemberInfo.jsp");
			dis.forward(request, response);
		}
	}

}
