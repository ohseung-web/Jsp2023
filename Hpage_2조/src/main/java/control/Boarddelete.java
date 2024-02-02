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


@WebServlet("/Boarddelete.do")
public class Boarddelete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	
	TeteumDAO tdao = new TeteumDAO();
	
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	System.out.println(b_no);
	
	tdao.deleteboard(b_no);
		
	RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Board_list.do");
	dis.forward(request, response);
	}

}
