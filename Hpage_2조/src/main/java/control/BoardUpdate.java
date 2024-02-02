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


@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}	
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TeteumDAO tdao = new TeteumDAO();
		
		String b_type = request.getParameter("b_type");
		
		String b_content = request.getParameter("b_content");
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		
		tdao.Updateboard(b_type, b_content, b_no);
		
		RequestDispatcher dis = request.getRequestDispatcher("MainList.do?section=Board_list.do");
		dis.forward(request, response);
		
	}

}
