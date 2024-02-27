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
import model.ProductDTO;

@WebServlet("/MainList.do")
public class MainList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		String category = request.getParameter("category");
		if(category == null) {
			category = "1";
		}
		
		ArrayList<ProductDTO> pdto = ldao.getAllProduct(Integer.parseInt(category), 1, 4);
		ArrayList<ProductDTO> pdto4 = ldao.getAllProduct(4, 1, 4);
		ArrayList<ProductDTO> pdto3 = ldao.getAllProduct(3, 1, 4);
		ArrayList<ProductDTO> pdto5 = ldao.getAllProduct(5, 1, 4);
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("pdto4", pdto4);
		request.setAttribute("pdto3", pdto3);
		request.setAttribute("pdto5", pdto5);
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		rd.forward(request, response);
	}
}
