package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeteumDAO;
import model.TeteumDTO;


@WebServlet("/Boardselect.do")
public class Boardselect extends HttpServlet {
	
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

		String b_type = request.getParameter("B_type");
		String b_title = request.getParameter("B_title");
		String id = request.getParameter("id");
		String b_regdate = request.getParameter("b_regdate");
		String b_content = request.getParameter("b_content");
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		tdto = tdao.getBoard(b_no);
		
		request.setAttribute("tdto", tdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Boardselect.jsp");
		dis.forward(request, response);
		
	}
}
