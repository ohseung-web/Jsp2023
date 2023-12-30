package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentDAO;
import model.RentDTO;


@WebServlet("/RentInfo.do")
public class RentInfo extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
   
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 받아온 no값 저장
		int no = Integer.parseInt(request.getParameter("no"));
		RentDAO rdao = new RentDAO();
		RentDTO rdto = rdao.getOneCar(no);
		
		request.setAttribute("rdto", rdto);
		
		RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=RentInfo.jsp");
		rdis.forward(request, response);
		
	}

}


