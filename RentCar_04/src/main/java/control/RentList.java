package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RentDAO;
import Model.RentDTO;


@WebServlet("/RentListPro.do")
public class RentList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      //데이터베이스 연결하여 회원의 모든 정보를 리턴한다.
		        RentDAO  rdao = new RentDAO();
				ArrayList<RentDTO>  a = rdao.getAllCar();
							
				//데이터를 jsp쪽으로 떠넘겨 준다. 단, 데이터를 가지고 간다.
				//ArrayList를 jsp쪽으로 넘겨 줌
				request.setAttribute("a", a);
		         /*System.out.println("a:"+rdao.getAllCar());*/
				RequestDispatcher dis = request.getRequestDispatcher("RentList.jsp");
				dis.forward(request, response);
		   
	}
}
