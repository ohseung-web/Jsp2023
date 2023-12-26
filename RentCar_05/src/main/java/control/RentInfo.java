package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.RentDAO;
import Model.RentDTO;

@WebServlet("/RentInfo.do")
public class RentInfo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	 protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
	      session.setAttribute("no", Integer.parseInt(request.getParameter("no")));
	       
			int no = (Integer) session.getAttribute("no");
			
	         // 데이터 베이스 접근
			RentDAO rdao = new RentDAO();
	      
	         //RentDTO 타입으로 개인 정보를 리턴
			RentDTO rdto = rdao.getOneCar(no);
				
			request.setAttribute("no",rdto.getNo());
			request.setAttribute("name",rdto.getName());
			request.setAttribute("category",rdto.getCategory());
			request.setAttribute("price",rdto.getPrice());
			request.setAttribute("usepeople",rdto.getUsepeople());
			request.setAttribute("company",rdto.getCompany());
			request.setAttribute("img",rdto.getImg());
			request.setAttribute("info",rdto.getInfo());
			
			RequestDispatcher dis = request.getRequestDispatcher("RentInfo.jsp");
			dis.forward(request, response);
		 
	}
}
