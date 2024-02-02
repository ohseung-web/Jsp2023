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


@WebServlet("/Boarduserinfo.do")
public class Boarduserinfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TeteumDAO tdao = new TeteumDAO();
		TeteumDTO tdto = new TeteumDTO();
		
		int b_no = Integer.parseInt(request.getParameter("b_no")); 
		
		HttpSession session = request.getSession();
		
		String sid = (String)session.getAttribute("id"); // 현재 로그인된 id
		String boardid = tdao.getOneId(sid);
		String id = request.getParameter("id"); // 제목 누르면서 받아온 id
		
		
		if(sid == null) {
			request.setAttribute("loginessential", "로그인 후 이용 가능합니다.");
			request.setAttribute("section", "Login.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
			dis.forward(request, response);
			
		}else {
			
			
			if(!boardid.equals(id)) {
				
				request.setAttribute("loginessential", "해당 게시글은 볼 수 없습니다.");
				request.setAttribute("section", "Board_list.do");
				RequestDispatcher dis = request.getRequestDispatcher("Alert.jsp");
				dis.forward(request, response);
				
			}else {
				tdto = tdao.getBoard(b_no);
				
				request.setAttribute("tdto", tdto);
				
				RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Boarduserinfo.jsp");
				
				dis.forward(request, response);
			}

			
		}
		
			
		}
		
		

}
