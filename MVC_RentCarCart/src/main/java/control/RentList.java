package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentDAO;
import model.RentDTO;

@WebServlet("/RentListPro.do")
public class RentList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
    protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	//데이터베이스 연결하여 모든 자동차 정보를 리턴한다.
    	RentDAO rdao = new RentDAO();
    	ArrayList<RentDTO> alist = rdao.getAllCar();
    	
    	request.setAttribute("alist", alist);
    	RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=RentList.jsp");
    	rdis.forward(request, response);
    	
	}

}

